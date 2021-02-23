import Foundation

struct User: Codable {
    var name: String
    var street: String
    var city: String
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case address
    }
    
    enum AddressCodingKeys: String, CodingKey {
        case street
        case city
        case state
    }
    
    init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy:
    CodingKeys.self)
       name = try container.decode(String.self, forKey: .name)
       let address = try container.nestedContainer(keyedBy:
    AddressCodingKeys.self, forKey: .address)
       street = try address.decode(String.self, forKey: .street)
       city = try address.decode(String.self, forKey: .city)
       state = try address.decode(String.self, forKey: .state)
    }
    
    func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(name, forKey: .name)
       var address = container.nestedContainer(keyedBy:
    AddressCodingKeys.self, forKey: .address)
       try address.encode(street, forKey: .street)
       try address.encode(city, forKey: .city)
       try address.encode(state, forKey: .state)
    }
}

let jsonString = """
{
   "name": "Taylor Swift",
   "address": {
      "street": "555 Taylor Swift Avenue",
      "city": "Nashville",
      "state": "Tennessee"
} }
"""
let jsonData = Data(jsonString.utf8)


let encoder = JSONEncoder()
let newUserData = try encoder.encode(user)
let newUserString = String(decoding: newUserData, as:
UTF8.self)


let decoder = JSONDecoder()
let user = try decoder.decode(User.self, from: jsonData)
print(user.city)


