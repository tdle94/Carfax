//
//  VehicleViewModel.swift
//  Carfax
//
//  Created by Tuyen Le on 6/26/21.
//

import Foundation
import UIKit

class VehicleViewModel {
    var vehicle: Vehicle
    
    var formattedPhoneNumber: String {
        return vehicle.dealer.phone.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func callDealerPhoneNumber(_ phoneNumber: String?) {
        guard let number = phoneNumber else { return }
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
