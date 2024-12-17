//
//  Task_6.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 17.12.2024.
//

import SwiftUI

struct Task_6: View {
    @State var isVertical = false
    private let spacing: CGFloat = 5
    private let countRectangle = 7
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let size = isVertical
                ? height / CGFloat(countRectangle)
                : (width - spacing * CGFloat(countRectangle - 1)) / CGFloat(countRectangle)
            
            ForEach(0..<countRectangle, id: \.self) { index in
                Rectangle()
                    .fill(.blue)
                    .frame(width: size, height: size)
                    .cornerRadius(8)
                    .offset(
                        x: isVertical
                            ? (size - (height - width) / CGFloat(countRectangle - 1)) * CGFloat(index)
                            : CGFloat(index) * size + spacing * CGFloat(index),
                        y: isVertical
                            ? height - size * (CGFloat(index) + 1)
                            : height / 2 - size / 2
                    ).onTapGesture {
                        withAnimation {
                            isVertical.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    Task_6()
}
