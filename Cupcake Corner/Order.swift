//
//  Order.swift
//  Cupcake Corner
//
//  Created by Mehmet Alp Sönmez on 10/06/2024.
//

import Foundation

@Observable

class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var extraFrosting = false
    var addSprinkles = false
    
}
