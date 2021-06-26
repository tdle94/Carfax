//
//  HomePageViewModel.swift
//  Carfax
//
//  Created by Tuyen Le on 6/25/21.
//

import Foundation
import RxSwift

class HomePageViewModel {
    private let network = CarFaxNetwork()
    
    var carfaxVehicleListing: PublishSubject<[Vehicle]> = PublishSubject()
    
    init() {
        getVehicles()
    }
    
    func getVehicles() {
        network.getVehicles { result in
            switch result {
            case .success(let carfaxResult):
                self.carfaxVehicleListing.onNext(carfaxResult.listings)
            case .failure(let error):
                self.carfaxVehicleListing.onError(error)
            }
        }
    }
}
