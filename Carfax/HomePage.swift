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
    
    let tableBackgroundView = UINib(nibName: String(describing: VehicleTableBackgroundView.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? VehicleTableBackgroundView
    
    @IBOutlet weak var vehicleTableView: UITableView! {
        didSet {
            vehicleTableView.register(UINib(nibName: String(describing: VehicleTableViewCell.self), bundle: nil),
                                      forCellReuseIdentifier: "VehicleTableViewCell")
            let refresh = UIRefreshControl()
            refresh.addTarget(self, action: #selector(refreshVehicleList), for: .valueChanged)
            vehicleTableView.tableFooterView = UIView()
            vehicleTableView.backgroundView = tableBackgroundView
            vehicleTableView.refreshControl = refresh
            vehicleTableView.separatorInset.left = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    @objc func refreshVehicleList() {
        viewModel.getVehicles()
    }
    
    func bindUI() {
        viewModel
            .carfaxVehicleListing
            .catch { error in
                DispatchQueue.main.async {
                    self.tableBackgroundView?.errorLabel.text = error.localizedDescription
                }
                return Observable.empty()
            }
            .bind(to: vehicleTableView.rx.items(cellIdentifier: "VehicleTableViewCell")) { index, model, cell in
                let vehicleCell = cell as? VehicleTableViewCell
                vehicleCell?.configureVehicle(viewModel: VehicleViewModel(vehicle: model))
            }
            .disposed(by: disposeBag)
        
        viewModel
            .loadingIndicator
            .bind(to: vehicleTableView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
                        
        viewModel
            .loadingIndicator
            .bind(to: tableBackgroundView!.loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel
            .loadingIndicator
            .bind(to: tableBackgroundView!.stackView.rx.isHidden)
            .disposed(by: disposeBag)
            
        tableBackgroundView?
            .tryAgainButton
            .rx
            .tap
            .subscribe(onNext: {
                self.viewModel.getVehicles()
            })
            .disposed(by: disposeBag)
    }
}
