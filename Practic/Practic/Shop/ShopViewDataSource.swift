import Foundation
import UIKit

class ShopViewDataSource: NSObject, UITableViewDataSource{
    
    var cars: [Car] = [Car(id: UUID(), name: "Matiz", price: "555$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Granta", price: "55$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Largus", price: "5555$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Matiz", price: "555$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Granta", price: "55$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Largus", price: "5555$", Image: UIImage(named: "Image")),
                       Car(id: UUID(), name: "Granta", price: "55$", Image: UIImage(named: "Image"))]
    var carsBasket: [Car] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.reuseIdentifier, for: indexPath) as! CarsTableViewCell
        
        var car = cars[indexPath.row]
        
        cell.configureCell(with: car)
        var tapped = 0
        
        cell.addButtonTaped = {
            if tapped == 0{
                
                tapped += 1
                car.num += 1
                self.carsBasket.append(car)
                
            }else{
                tapped += 1
                car.num += 1
                
                self.carsBasket.removeAll{$0.id == car.id}
                
                self.carsBasket.append(car)
            }
        }
        return cell
    }
    
    func getBasketCars() -> [Car]{
        return carsBasket
    }
}
