import RxSwift
import Foundation

struct Repository: Codable {
    var fullName: String
    var url: URL
    var stargazersCount: Int
    var language: String
}

enum GitHubServiceError: Error {
    case offline
    case githubLimitReached
    case networkError
}

typealias SearchRepositoriesResponse = Result<[Repository], GitHubServiceError>

class GitHubSearchRepositoriesAPI {}

extension Reactive where Base == URLSession {
    func response(request: URLRequest) -> Single<(response: HTTPURLResponse, data: Data)> {
        return Single<(response: HTTPURLResponse, data: Data)>.create { observer in
            let task = base.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else {
                    observer(.error(error!))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    fatalError("unreachable")
                }
                
                observer(.success((httpResponse, data)))
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

extension GitHubSearchRepositoriesAPI {
    public func search(query: String) -> Single<SearchRepositoriesResponse> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)")!
        return loadSearchURL(url)
    }

    public func loadSearchURL(_ searchURL: URL) -> Single<SearchRepositoriesResponse> {
        return URLSession.shared
            .rx.response(request: URLRequest(url: searchURL))
            .retry(3)
            .map { pair -> SearchRepositoriesResponse in
                if pair.0.statusCode == 403 {
                    return .failure(.githubLimitReached)
                }

                struct Response: Codable {
                    let items: [Repository]
                }

                let response: Response = try GitHubSearchRepositoriesAPI.parseJSON(pair.0, data: pair.1)

                return .success(response.items)
            }
    }
}


extension GitHubSearchRepositoriesAPI {

    private static let parseLinksPattern = "\\s*,?\\s*<([^\\>]*)>\\s*;\\s*rel=\"([^\"]*)\""
    private static let linksRegex = try! NSRegularExpression(pattern: parseLinksPattern, options: [.allowCommentsAndWhitespace])

    private static func parseLinks(_ links: String) throws -> [String: String] {

        let length = (links as NSString).length
        let matches = GitHubSearchRepositoriesAPI.linksRegex.matches(in: links, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: length))

        var result: [String: String] = [:]

        for m in matches {
            let matches = (1 ..< m.numberOfRanges).map { rangeIndex -> String in
                let range = m.range(at: rangeIndex)
                let startIndex = links.index(links.startIndex, offsetBy: range.location)
                let endIndex = links.index(links.startIndex, offsetBy: range.location + range.length)
                return String(links[startIndex ..< endIndex])
            }

            if matches.count != 2 {
                fatalError("Error parsing links")
            }

            result[matches[1]] = matches[0]
        }
        
        return result
    }

    private static func parseJSON<T: Codable>(_ httpResponse: HTTPURLResponse, data: Data) throws -> T {
        if !(200 ..< 300 ~= httpResponse.statusCode) {
            fatalError("Call failed")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
    
}

let api = GitHubSearchRepositoriesAPI()

let condition = NSCondition()
let disposable = api.search(query: "Swift").map { try $0.get() }
    .map { $0.filter { $0.stargazersCount > 100 && $0.language == "Swift" } }
    .asObservable()
    .flatMap { Observable.from($0) }
    .subscribe(
        onNext: { (repository: Repository) in
            print("\(repository.fullName) | \(repository.url)")
        },
        onError: { error in
            dump(error)
        },
        onCompleted: {
            condition.signal()
    })
condition.wait()
