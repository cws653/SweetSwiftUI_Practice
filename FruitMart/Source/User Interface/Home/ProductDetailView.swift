//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by 최원석 on 2023/03/25.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product // 상품 정보를 전달받기 위한 프로퍼티 선언
    
    var body: some View {
        VStack(spacing: 0) {
            productImage // 상품 이미지
            orderView // 상품 정보를 출력하고 그 상품을 주문하기 위한 뷰
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    var productImage: some View {
        GeometryReader { _ in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            // 지오메트리 리더가 차지하는 뷰의 높이보다 VStack의 높이가 10 크도록 지정
            .frame(height: $0.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle).fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(Color.peach)
                    .frame(width: 32, height: 32)
            }
            
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
      HStack {
        (Text("₩")
          + Text("\(product.price)").font(.title)
          ).fontWeight(.medium)
        Spacer()
      }
      .foregroundColor(.black)
    }
        
    // 배경을 다크 모드에서도 항상 흰색이 되게 지정해 텍스트도 항상 검은색이 되게 지정
    
    var placeOrderButton: some View {
        Button(action: {}) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(Text("주문하기"))
                    .font(.system(size: 20)).fontWeight(.medium)
                    .foregroundColor(Color.white)
                .padding(.vertical, 8)
        }
    }
    
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
        ?? text[centerIdx...].firstIndex(of: " ")
        ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}
