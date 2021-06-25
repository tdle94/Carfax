//
//  CarfaxAPI.swift
//  Carfax
//
//  Created by Tuyen Le on 6/24/21.
//

import Foundation

struct CarFaxNetwork {
    let session: CarFaxSession
    
    enum APIError: Error {
        case invalidStatusCode
        case noResponseData
        case cannotDecode
    }
    
    init(session: CarFaxSession = URLSession.shared) {
        self.session = session
    }
    
    func getVehicles(completion: @escaping (Result<CarfaxListings, Error>) -> Void) {
        let url = URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json")!
        session.fetch(url: url, responseType: CarfaxListings.self) { result in
            completion(result)
        }
    }
}
