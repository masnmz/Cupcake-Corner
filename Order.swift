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
    var quantity = 1
    
    var specialRequestEnable = false
    var extraFrosting = false
    var addSprinkles = false
    
}
