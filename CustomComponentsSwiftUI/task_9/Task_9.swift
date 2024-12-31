//
//  Task_9.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 31.12.2024.
//

import SwiftUI

struct Task_9: View {
    
    @State var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            RadialGradient(colors: [.yellow, .red], center: .center, startRadius: 70, endRadius: 160)
                .mask {
                    Canvas { context, size in
                        context.addFilter(.alphaThreshold(min: 0.5, color: .white))
                        context.addFilter(.blur(radius: 40))
                        
                        context.drawLayer { ctx in
                            for index in [1, 2] {
                                if let resolved = context.resolveSymbol(id: index) {
                                    ctx.draw(resolved, at: .init(x: size.width / 2, y: size.height / 2))
                                }
                            }
                        }
                        
                    } symbols: {
                        ball
                            .tag(1)
                        ball
                            .tag(2)
                            .offset(dragOffset)
                    }
                    
                }
            Image(systemName: "cloud.sun.rain.fill")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .offset(dragOffset)
                .foregroundStyle(.white)

                
        }
        .gesture(DragGesture()
            .onChanged{ drag in
                dragOffset = drag.translation
            }
            .onEnded({ _ in
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7),{
                    dragOffset = .zero
                })
            }
                    )
        )
    }
    var ball: some View {
        Circle()
            .foregroundColor(.white)
            .frame(width: 150, height: 150)
    }
    
    
}

#Preview {
    Task_9()
}
