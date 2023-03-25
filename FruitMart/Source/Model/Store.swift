//
//  Store.swift
//  FruitMart
//
//  Created by 최원석 on 2023/03/25.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

final class Store {
    var products: [Product]
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
