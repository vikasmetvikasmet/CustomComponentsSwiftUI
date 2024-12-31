//
//  Task_9.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 31.12.2024.
//

import SwiftUI

struct Task_9: View {
    @State private var isDragging = false
    @State var dragOffset = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Color.red
            Color.yellow
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .blur(radius: 15)
            
            Image(systemName: "cloud.sun.rain.fill")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .offset(dragOffset)
            
        }.mask {
            Canvas { context, size in
                let circleYellow = context.resolveSymbol(id: 1)
                let circleRed = context.resolveSymbol(id: 2)
                let rect = CGPoint(x: size.width / 2, y: size.height / 2)
                
                context.addFilter(.alphaThreshold(min: 0.5))
                context.addFilter(.blur(radius: 15))
                
                context.drawLayer { ctx in
                    
                    ctx.draw(circleYellow!, at: rect)
                    ctx.draw(circleRed!, at: rect)
                }
                
            } symbols: {
                Circle()
                    .frame(width: 150, height: 150)
                    .offset(dragOffset)
                    .tag(1)
                Circle()
                    .frame(width: 150, height: 150)
                    .tag(2)
            }
        }.background(wallpaper)
            .gesture(drag)
            .ignoresSafeArea()
    }
    
    var wallpaper: some View {
        Image("capa")
            .resizable()
            .blur(radius: 7)
            .scaleEffect(1.2)
            .ignoresSafeArea()
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value  in
                self.isDragging = true
                dragOffset = value.translation
            }
            .onEnded { _ in
                withAnimation(.interpolatingSpring(stiffness: 150, damping: 15)) {
                    self.isDragging = false
                    dragOffset = .zero
                }
                
            }
    }
}

#Preview {
    Task_9()
}
