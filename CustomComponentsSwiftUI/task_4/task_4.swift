//
//  task_4.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 10.12.2024.
//

import SwiftUI

struct Task_4: View {
    @State private var isAnimating = false
    var body: some View {
        Button {
            if !isAnimating {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
                    isAnimating = false
                }
            }
        } label: {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 70, height: 70)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .opacity(isAnimating ? 1: .zero)
                
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
                            .foregroundColor(Color.black)
                        
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                            .foregroundColor(Color.black)
                        
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: isAnimating ? 0.5 : width)
                            .opacity(isAnimating ? .zero : 1)
                            .foregroundColor(Color.black)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    .scaleEffect(isAnimating ? 0.86 : 1)
                    
                }.frame(maxWidth: 62)
            }
        }
    }
}

#Preview {
    Task_4()
}
