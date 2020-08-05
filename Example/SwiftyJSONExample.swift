@_silgen_name("_runBenchmark")
public func runBenchmark(_ fn: (Int) -> Void) -> Void

import SwiftyJSON


let json = """
{
   "people":[
      {
         "firstName":"Paul",
         "lastName":"Hudson",
         "isAlive":true
      },
      {
         "firstName":"Angela",
         "lastName":"Merkel",
         "isAlive":true
      },
      {
         "firstName":"George",
         "lastName":"Washington",
         "isAlive":false
      }
   ]
}
"""

runBenchmark { n in
  for _ in 0..<n {
    if let data = json.data(using: .utf8) {
      if let json = try? JSON(data: data) {
        for item in json["people"].arrayValue {
            _ = item["firstName"].stringValue
        }
      }
    }
  }
}