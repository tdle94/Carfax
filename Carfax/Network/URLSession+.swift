//
//  URLSession+.swift
//  Carfax
//
//  Created by Tuyen Le on 6/25/21.
//

import Foundation

extension URLSession: CarFaxSession {
    func fetch<T : Decodable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = dataTask(with: URLRequest(url: url)) { responseData, urlResponse, responseError in
            if let error = responseError {
                completion(.failure(error))
                return
            }
            
            guard let response = urlResponse as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 299 else {
                completion(.failure(CarFaxNetwork.APIError.invalidStatusCode))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(CarFaxNetwork.APIError.noResponseData))
                return
            }
            
            do {
                let decodeObj = try JSONDecoder().decode(responseType.self, from: data)
                completion(.success(decodeObj))
            } catch let error {
                print(error)
                completion(.failure(CarFaxNetwork.APIError.cannotDecode))
            }
        }
        
        task.resume()
    }

}
