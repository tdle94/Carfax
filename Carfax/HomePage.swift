//
//  ViewController.swift
//  Carfax
//
//  Created by Tuyen Le on 6/24/21.
//

import UIKit
import RxDataSources
import RxSwift

class HomePage: UIViewController {
    
    let viewModel = HomePageViewModel()
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var vehicleTableView: UITableView! {
        didSet {
            vehicleTableView.register(UINib(nibName: String(describing: VehicleTableViewCell.self), bundle: nil),
                                      forCellReuseIdentifier: "VehicleTableViewCell")
            vehicleTableView.tableFooterView = UIView()
            vehicleTableView.separatorInset.left = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI() {
        viewModel
            .carfaxVehicleListing
            .bind(to: vehicleTableView.rx.items(cellIdentifier: "VehicleTableViewCell")) { index, model, cell in
                let vehicleCell = cell as? VehicleTableViewCell
                vehicleCell?.configureVehicle(model)
            }
            .disposed(by: disposeBag)

    }
}
