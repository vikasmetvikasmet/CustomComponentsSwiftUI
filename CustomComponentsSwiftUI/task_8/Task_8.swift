//
//  Task_8.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 23.12.2024.
//

import SwiftUI

struct Task_8: View {
    @State var value = 0.3
    @State private var isTouching: Bool = false
    @State private var startValue: CGFloat = 0
    @State private var hScale: CGFloat = 1
    @State private var vScale: CGFloat = 1
    @State private var offset: CGFloat = 0
    let shapeSize = CGSize(width: 100, height: 225)
    
    var body: some View {
        ZStack {
            wallpaper
            ZStack {
                GeometryReader { proxy in
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                    VStack {
                        Spacer(minLength: 0)
                        Rectangle()
                            .frame(height: value * proxy.size.height)
                            .foregroundColor(.white)
                    }
                }
                
            }.clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .frame(width: shapeSize.width, height: shapeSize.height)
                .offset(y: offset)
                .scaleEffect(x: hScale, y: vScale)
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ drag in
                        if !isTouching {
                            startValue = value
                        }
                        isTouching = true
                        let value = startValue - (drag.translation.height / shapeSize.height)
                        self.value = min(max(value, 0), 1)
                        var scale: CGFloat = 1
                        var offset: CGFloat = 0
                        
                        if value > 1 {
                            scale = sqrt(sqrt(sqrt(value)))
                            offset = shapeSize.height * (1 - scale)
                        } else if value < 0 {
                            scale = sqrt(sqrt(sqrt(1 - value)))
                            offset = -shapeSize.height * (1 - scale)
                        } else {
                            scale = 1
                        }
                        vScale = scale
                        hScale = 2 - scale
                        
                        self.offset = offset
                    })
                        .onEnded{ _ in
                            isTouching = false
                            withAnimation{
                                vScale = 1
                                hScale = 1
                                offset = 0
                            }
                        }
                )
        }
    }
    var wallpaper: some View {
        Image("capa")
            .resizable()
            .blur(radius: 7)
            .scaleEffect(1.2)
            .ignoresSafeArea()
    }
}

#Preview {
    Task_8()
}
