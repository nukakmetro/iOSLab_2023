import UIKit

class ShopViewController: UIViewController, BasketControllerDelegate {
    
    func dataUpdatedBasket(with cars: [Car]) {
        tableDataSoure.carsBasket = cars
    }
    
      private lazy var customView: ShopView = {
        return ShopView(frame: .zero)
    }()
    
    private let tableDataSoure = ShopViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = customView
        customView.controller = self
        customView.setTableDataSource(tableDataSoure)
        navigateSetup()
        
    }
    
    func navigateSetup(){
        navigationItem.title = "Shop"
        let basketAction: UIAction = UIAction { _ in
            let cars = self.tableDataSoure.getBasketCars()
            let basketController = BasketViewController(with: cars, delegate: self)
            self.navigationController?.pushViewController(basketController, animated: true)
               }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket"), primaryAction: basketAction)
    }
    
    @objc func tuppedToBasket(){
       let cars = tableDataSoure.getBasketCars()
        let basketController = BasketViewController(with: cars, delegate: self)
        navigationController?.pushViewController(basketController, animated: true)
    }
}


