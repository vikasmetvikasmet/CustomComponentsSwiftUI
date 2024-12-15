//
//  task_5.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 15.12.2024.
//

import SwiftUI

struct Task_5: View {
    let height = UIScreen.main.bounds.height * 0.25
    @State var position = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY
    )
    let colors: [Color] = [Color.white, .pink, .yellow, .black]
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                ForEach(colors, id: \.self ) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: height)
                }
            }
            
            Color.white
                .blendMode(.difference)
                .overlay {
                    Rectangle()
                        .overlay(.white.blendMode(.overlay))
                        .overlay(.black.blendMode(.overlay))
                }
                .blendMode(.saturation)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .position(x: position.x, y: position.y)
                .gesture(
                    DragGesture().onChanged { position = $0.location }
                )
        }
    }
}

#Preview {
    Task_5()
}
