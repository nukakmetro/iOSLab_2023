import Foundation
import UIKit

class BasketViewDataSource {
    
    enum TableSection {
        case main
    }
    
    var carsBasket: [Car] = []
    
    var dataSource: UITableViewDiffableDataSource<TableSection, Car>?
    
    func setupDataSource(tableView: UITableView, cars: [Car]) {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, car in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CarsinTheBasketTableViewCell.reuseIdentifier, for: indexPath) as! CarsinTheBasketTableViewCell
            
            var newCar = car
            
            cell.minusButtonTapped = {
                if newCar.num > 1{
                    newCar.num -= 1
                    self.carsBasket.removeAll{$0.id == newCar.id}
                    self.carsBasket.append(newCar)
                    cell.numLabel.text = String(newCar.num)
                }else if newCar.num == 1{
                    newCar.num -= 1
                    cell.numLabel.text = String(newCar.num)
                    self.carsBasket.removeAll{$0.id == newCar.id}
                   // хотел уведомление подключить
                }
            }

            cell.addButtonTaped = {
                newCar.num += 1
                self.carsBasket.removeAll{$0.id == newCar.id}
                self.carsBasket.append(newCar)
                cell.numLabel.text = String(newCar.num)
            }
            
            cell.configureCell(with: newCar)
            return cell
        })
            carsBasket.removeAll{$0.num == 0}
            updateData(with: cars, animate: false)
    }
    
    func getCars() -> [Car]{
        return carsBasket
    }
                                                   
    
    // MARK: - updateData
    func updateData(with cars: [Car], animate: Bool) {
        
        var newCars = cars
        newCars.removeAll{$0.num == 0}
        
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Car>()
        snapshot.appendSections([.main])
        snapshot.appendItems(newCars)
        dataSource?.apply(snapshot, animatingDifferences: animate)
    }
    
    func getSizeCars() -> Int{
        return carsBasket.count
    }
}


