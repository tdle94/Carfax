//
//  VehicleViewModel.swift
//  Carfax
//
//  Created by Tuyen Le on 6/26/21.
//

import Foundation
import UIKit

class VehicleViewModel {
    let vehicle: Vehicle
    
    var formattedPhoneNumber: String {
        return vehicle.dealer.phone.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
    
    var makeModelYearLabel: String {
        return String(vehicle.year) + " " + vehicle.make + " " + vehicle.model
    }
    
    var priceMileageAddress: NSAttributedString {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        if let currency = formatter.string(from: NSNumber(value: vehicle.listPrice)) {
            let attrString = NSMutableAttributedString(string: currency, attributes: [ .font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize) ])
            attrString.append(NSAttributedString(string: " | " + String(vehicle.mileage) + "k Mi", attributes: [ .font: UIFont.systemFont(ofSize: UIFont.systemFontSize) ]))
            attrString.append(NSAttributedString(string: " | " + vehicle.dealer.city + ", " + vehicle.dealer.state, attributes: [ .font: UIFont.systemFont(ofSize: UIFont.systemFontSize)]))

            return attrString
        }

        return NSAttributedString()
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
