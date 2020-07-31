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

if let data = json.data(using: .utf8) {
    if let json = try? JSON(data: data) {
        for item in json["people"].arrayValue {
            print(item["firstName"].stringValue)
        }
    }
}
