//
//  BasketViewController.swift
//  Practic
//
//  Created by surexnx on 17.10.2023.
//

import UIKit
protocol BasketControllerDelegate: AnyObject {
    func dataUpdatedBasket(with cars: [Car])
}

class BasketViewController: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.dataUpdatedBasket(with: dataSource.getCars())
    }
    
    private lazy var customView: BasketView = {
        return BasketView(frame: .zero)
    }()
    
    override func loadView() {
        view = customView
        customView.controller = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Basket"
    }
    
    var dataSource: BasketViewDataSource
    
    private weak var delegate: BasketControllerDelegate?

    init(with car: [Car], delegate: BasketControllerDelegate?) {
        
        self.dataSource = BasketViewDataSource()

        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        dataSource.setupDataSource(tableView: customView.tableView, cars: car)
        dataSource.carsBasket = car
        hiddenLabel(cars: car)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hiddenLabel(cars: [Car]){
        if cars.count == 0{
            customView.notificationLabel.isHidden = false
            return
        }
        customView.notificationLabel.isHidden = true
    }
    
}
