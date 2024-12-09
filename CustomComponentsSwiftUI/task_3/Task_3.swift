//
//  Task_3.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 07.12.2024.
//

import SwiftUI

struct Task_3: View {
    @State private var isAnimating = false
    var body: some View {
        Button {
            if !isAnimating {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    isAnimating = true
                } completion: {
                    isAnimating = false
                }
            }
        } label: {
            GeometryReader { proxy in
                let width = proxy.size.width / 2
                let systemName = "play.fill"
                
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isAnimating ?  width: .zero)
                        .opacity(isAnimating ? 1 : .zero)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    Image(systemName: systemName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isAnimating ? 0.5 : width)
                        .opacity(isAnimating ? .zero: 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
            }.frame(maxWidth: 62)
        }
    }
}

#Preview {
    Task_3()
}
