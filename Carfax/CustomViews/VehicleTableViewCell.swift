//
//  VehicleTableViewCell.swift
//  Carfax
//
//  Created by Tuyen Le on 6/25/21.
//

import UIKit
import SDWebImage

class VehicleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vehicleImage: UIImageView! {
        didSet {
            vehicleImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
    }
    @IBOutlet weak var vehicleMakeModelYearLabel: UILabel!
    @IBOutlet weak var vehiclePriceMileageAddress: UILabel!
    @IBOutlet weak var dealerPhoneNumberButton: UIButton!
    
    
    func configureVehicle(_ vehicle: Vehicle) {
        vehicleMakeModelYearLabel.text = String(vehicle.year) + " " + vehicle.make + " " + vehicle.model
        vehiclePriceMileageAddress.text = String(vehicle.listPrice) + " | " + String(vehicle.mileage) + "k Mi" + " | " + vehicle.dealer.address
        vehicleImage.sd_setImage(with: URL(string: vehicle.images.large.first!), completed: nil)
    }
    
    @IBAction func callDealerTap() {
        
    }
}
