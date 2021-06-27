//
//  VehicleTableViewCell.swift
//  Carfax
//
//  Created by Tuyen Le on 6/25/21.
//

import UIKit
import SDWebImage

class VehicleTableViewCell: UITableViewCell {
    
    private var viewModel: VehicleViewModel?
    
    @IBOutlet weak var vehicleImage: UIImageView! {
        didSet {
            vehicleImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
    }
    @IBOutlet weak var vehicleMakeModelYearLabel: UILabel!
    @IBOutlet weak var vehiclePriceMileageAddress: UILabel!
    @IBOutlet weak var dealerPhoneNumberButton: UIButton!
    
    override func prepareForReuse() {
        vehicleImage.image = nil
        viewModel = nil
    }
    
    func configureVehicle(viewModel: VehicleViewModel) {
        self.viewModel = viewModel

        vehicleMakeModelYearLabel.text = viewModel.makeModelYearLabel
        vehiclePriceMileageAddress.attributedText = viewModel.priceMileageAddress
        dealerPhoneNumberButton.setTitle(viewModel.formattedPhoneNumber, for: .normal)
        vehicleImage.sd_setImage(with: URL(string: viewModel.vehicle.images.large.first!)) { image, error, _ , _ in
            if error != nil {
                self.vehicleImage.image = UIImage(named: "NoImage")
            } else {
                self.vehicleImage.image = image
            }
        }
    }
    
    @IBAction func callDealerTap() {
        viewModel?.callDealerPhoneNumber(viewModel?.vehicle.dealer.phone)
    }
}
