//
//  task_4.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 10.12.2024.
//

import SwiftUI

struct Task_4: View {
    var body: some View {
        ForwardButton()
            .buttonStyle(PressButtonStyle())
    }
}

struct ForwardButton: View {
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
        }
    }
}

struct PressButtonStyle: ButtonStyle {
    @State private var isProcessingPressBackground: Bool = false
    
    let duration: TimeInterval = 0.22
    let scale: CGFloat = 0.86
    let buttonSize: CGFloat = 80
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.secondary)
                .frame(maxWidth: buttonSize, maxHeight: buttonSize)
                .opacity(isProcessingPressBackground ? 0.3 : 0)
            configuration.label
                .padding(12)
        }
        .scaleEffect(isProcessingPressBackground ? scale : 1)
        .animation(.easeOut(duration: duration), value: configuration.isPressed)
        .onChange(of: configuration.isPressed) { newValue in
            if newValue {
                withAnimation(.easeOut(duration: duration)) {
                    isProcessingPressBackground = true
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                withAnimation(.easeOut(duration: 0)) {
                        isProcessingPressBackground = false
                    }
                }
            }
        }
    }
}

#Preview {
    Task_4()
}
