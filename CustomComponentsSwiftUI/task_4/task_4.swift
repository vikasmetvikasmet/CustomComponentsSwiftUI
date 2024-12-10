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
                completion: {
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
                
            }.frame(maxWidth: 62)
        }.buttonStyle(CustomButtonStyle(isAnimating: $isAnimating))
    }
}

struct CustomButtonStyle: ButtonStyle {
    @Binding var isAnimating: Bool
    private let animationDuration: CGFloat = 0.22
    private let backgroundColor: Color = Color.gray.opacity(0.3)
    private let buttonSize: CGFloat = 70
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .scaleEffect(isAnimating ? 0.86 : 1)
            .background{
                Circle()
                    .fill(backgroundColor)
                    .frame(width: buttonSize, height: buttonSize)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .opacity(isAnimating ? 1: 0)
                    .animation(.easeInOut(duration: animationDuration), value: isAnimating)
            }
    }
}

#Preview {
    Task_4()
}
