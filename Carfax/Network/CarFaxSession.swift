//
//  CarFaxSession.swift
//  Carfax
//
//  Created by Tuyen Le on 6/25/21.
//

import Foundation

protocol CarFaxSession {
    func fetch<T : Decodable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
