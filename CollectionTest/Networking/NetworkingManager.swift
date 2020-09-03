import Foundation
import Alamofire

class NetworkingManager{
    static func getPhotosUrl(completion: @escaping (Result<[Photo]>) -> Void){
        Alamofire.request(
            "https://api.thecatapi.com/v1/images/search?limit=10&order=desc",
            method: .get,
            parameters: nil
            )
            .responseData { (response: DataResponse<Data>) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let photos = try decoder.decode([Photo].self, from: data)
                        completion(.success(photos))
                    } catch {
                        completion(.failure(error))
                    }
                case.failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
