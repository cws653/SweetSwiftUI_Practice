//
//  Order.swift
//  FruitMart
//
//  Created by 최원석 on 2023/03/26.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 }
    
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int {
        return product.price * quantity
    }
}
