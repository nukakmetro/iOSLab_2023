//
//  Cars.swift
//  Practic
//
//  Created by surexnx on 17.10.2023.
//

import Foundation
import UIKit

struct Car: Hashable, Identifiable{
    let id: UUID
    let name: String
    let price: String
    let Image: UIImage?
    var num: Int
    
    init(id: UUID, name: String, price: String, Image: UIImage?) {
        self.id = id
        self.name = name
        self.price = price
        self.Image = Image
        self.num = 0
    }
}
