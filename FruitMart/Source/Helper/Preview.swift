//
//  Preview.swift
//  FruitMart
//
//  Created by 최원석 on 2023/03/26.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct Preview<V: View>: View {
    enum Device: String, CaseIterable {
        case iPhone8 = "iPhone 8"
        case iPhone11 = "iPhone 11"
        case iPhone11Pro = "iPhone 11 Pro"
        case iPhone1ProMax = "iPhone 11 Pro Max"
    }
    
    let source: V // 프리뷰에서 표현될 뷰
    var devices: [Device] = [.iPhone11Pro, .iPhone1ProMax, .iPhone8]
    var displayDarkMode: Bool = true // 다크 모드 출력 여부 결정
    
    var body: some View {
        return Group {
            ForEach(devices, id: \.self) { // 기기 목록 수만큼 반복
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0])
                    .preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device: Device) -> some View {
        source
            .previewDevice(PreviewDevice(rawValue: device.rawValue)) // 기기 형태
            .previewDisplayName(device.rawValue) // 프리뷰 컨테이너에 표시할 이름
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Text("Hello, SwiftUI!"))
    }
}
