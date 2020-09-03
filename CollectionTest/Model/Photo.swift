import Foundation

final class Photo: Codable{
    let url:String
    
    enum CodingKeys: String, CodingKey{
        case url = "url"
    }
}
