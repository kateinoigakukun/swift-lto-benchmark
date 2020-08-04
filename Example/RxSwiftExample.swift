import RxSwift
import Foundation

struct Repository: Codable {
    var fullName: String
    var stargazersCount: Int
}

enum GitHubServiceError: Error {
    case offline
    case githubLimitReached
    case networkError
}

typealias SearchRepositoriesResponse = Result<[Repository], GitHubServiceError>

class GitHubSearchRepositoriesAPI {}

extension GitHubSearchRepositoriesAPI {
    public func search(query: String) -> Single<SearchRepositoriesResponse> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)")!
        return loadSearchURL(url)
    }

    public func loadSearchURL(_ searchURL: URL) -> Single<SearchRepositoriesResponse> {
        return Single<SearchRepositoriesResponse>.create { observer in
            let result: SearchRepositoriesResponse = .success([
                Repository(fullName: "apple/swift", stargazersCount: 5000),
                Repository(fullName: "apple/swift-driver", stargazersCount: 400),
                Repository(fullName: "tensorflow/swift", stargazersCount: 600),
                Repository(fullName: "example/swift-demo", stargazersCount: 50),
            ])
            observer(.success(result))
            return Disposables.create {}
        }
    }
}


let api = GitHubSearchRepositoriesAPI()

_ = api.search(query: "Swift").map { try $0.get() }
    .map { $0.filter { $0.stargazersCount > 100 } }
    .asObservable()
    .flatMap { Observable.from($0) }
    .subscribe(
        onNext: { (repository: Repository) in
            print(repository.fullName)
        },
        onError: { error in
            dump(error)
        }
    )
