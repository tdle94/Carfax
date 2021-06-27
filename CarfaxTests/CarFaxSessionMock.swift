//
//  CarFaxSessionMock.swift
//  CarfaxTests
//
//  Created by Tuyen Le on 6/27/21.
//

import Foundation

class CarFaxSessionMock: CarFaxSession {
    
    var data: Data?
    var error: Error?
    
    func fetch<T>(url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        if let data = self.data {
            let decodeObj = try! JSONDecoder().decode(CarfaxListings.self, from: data)
            completion(.success(decodeObj as! T))
        }
    }
}
