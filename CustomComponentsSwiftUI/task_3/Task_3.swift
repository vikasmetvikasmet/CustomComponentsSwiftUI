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
            withAnimation(.bouncy) {
                isAnimating = true
            } completion: {
                isAnimating = false
            }
        } label: {
            HStack(spacing: 0) {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimating ? 50: 0)
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimating ? 1 : 50)
                    .opacity(isAnimating ? 0 : 1)
            }
            
        }

    }
}

#Preview {
    Task_3()
}
