//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by 최원석 on 2023/03/26.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill" : "heart" // 즐겨찾기 여부에 따라 심벌 변경
    }
    
    var body: some View {
        Button(action: {
            self.store.toggleFavorite(of: self.product) // 상품에 대한 즐겨찾기 설정 변경
        }) {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.peach)
                .frame(width: 32, height: 32)
        }
    }
}

//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton()
//    }
//}
