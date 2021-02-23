//import Foundation
//
//class Settings: NSObject, NSCoding {
//    var username: String
//    var age: Int
//    var lastLogin: Date
//    var friends: [String]
//    var darkMode: Bool
//
//    init(username: String, age: Int, lastLogin: Date, friends:
//            [String], darkMode: Bool) {
//        self.username = username
//        self.age = age
//        self.lastLogin = lastLogin
//        self.friends = friends
//        self.darkMode = darkMode
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        self.username = aDecoder.decodeObject(forKey: "username")
//            as! String
//        self.age = aDecoder.decodeInteger(forKey: "age")
//        self.lastLogin = aDecoder.decodeObject(forKey: "lastLogin")
//            as! Date
//        self.friends = aDecoder.decodeObject(forKey: "friends") as!
//            [String]
//        self.darkMode = aDecoder.decodeBool(forKey: "darkMode")
//    }
//
//    func encode(with aCoder: NSCoder) {
//       aCoder.encode(username, forKey: "username")
//       aCoder.encode(age, forKey: "age")
//       aCoder.encode(lastLogin, forKey: "lastLogin")
//       aCoder.encode(friends, forKey: "friends")
//       aCoder.encode(darkMode, forKey: "darkMode")
//    }
//}
//
//let settings = Settings(username: "tswift", age: 26, lastLogin:Date(), friends: ["Ed Sheeran"], darkMode: true)
//
//let data = NSKeyedArchiver.archivedData(withRootObject:settings)
//
//let str = String(decoding: data, as: UTF8.self)
//print(str)
//
//if let loadedSettings = try?
//NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as?
//Settings {
//   print(loadedSettings.username)
//}


import Foundation
import UIKit

struct Settings: Codable {
    var username: String
    var age: Int
    var lastLogin: Date
    var friends: [String]
    var darkMode: Bool
    var favoriteColor: UIColor

    init(username: String, age: Int, lastLogin: Date, friends:
            [String], darkMode: Bool, favoriteColor: UIColor) {
        self.username = username
        self.age = age
        self.lastLogin = lastLogin
        self.friends = friends
        self.darkMode = darkMode
        self.favoriteColor = favoriteColor
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case age
        case lastLogin = "last_login"
        case friends
        case darkMode = "dark_mode"
        case favoriteColor = "favorite_color"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:
                                                CodingKeys.self)
        username = try container.decode(String.self,
                                        forKey: .username)
        age = try container.decode(Int.self, forKey: .age)
        lastLogin = try container.decode(Date.self,
                                         forKey: .lastLogin)
        friends = try container.decode([String].self,
                                       forKey: .friends)
        darkMode = try container.decode(Bool.self,
                                        forKey: .darkMode)
        
        let colorData = try container.decode(Data.self,
        forKey: .favoriteColor)
        favoriteColor = (try?
        NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData)
        as? UIColor) ?? UIColor.black
        
        if !friends.contains("Tom") {
            friends.append("Tom")
        }
    }
    
    func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(username, forKey: .username)
       try container.encode(age, forKey: .age)
       try container.encode(lastLogin, forKey: .lastLogin)
       try container.encode(friends, forKey: .friends)
       try container.encode(darkMode, forKey: .darkMode)
        let colorData = NSKeyedArchiver.archivedData(withRootObject:
        favoriteColor)
        try container.encode(colorData, forKey: .favoriteColor)
    }
}

let settings = Settings(username: "tswift", age: 26, lastLogin:Date(), friends: ["Ed Sheeran"], darkMode: true, favoriteColor: UIColor.green)

let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
let data = try encoder.encode(settings)


let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601



let loadedSettings = try decoder.decode(Settings.self, from:
data)
print(loadedSettings)

//let str = String(decoding: data, as: UTF8.self)
//print(str)


