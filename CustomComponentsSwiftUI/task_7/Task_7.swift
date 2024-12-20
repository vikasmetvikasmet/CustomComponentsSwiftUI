//
//  Task_7.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 18.12.2024.
//

import SwiftUI

struct Task_7: View {
    @State private var isPressing =  true
    private var rectangleWidth: CGFloat { isPressing ? 110 : 300 }
    private var rectangleHeight: CGFloat { isPressing ? 60 : 400 }
    private var rectangleCornerRadius: CGFloat { isPressing ? 10 : 20 }
    private var rectangleOffset: CGSize { CGSize(width: isPressing ? 130 : 0, height: isPressing ? 350 : 0)}
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: rectangleWidth, height: rectangleHeight)
                .cornerRadius(rectangleCornerRadius)
                .offset(x: rectangleOffset.width, y: rectangleOffset.height)
                
            Button {
                withAnimation {
                    isPressing.toggle()
                    
                }
            } label: {
                Text(isPressing ? "Open" : "\(Image(systemName: "arrowshape.backward.fill")) Back")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .font(.headline)
                    .contentTransition(.identity)
                    .frame(width: isPressing ? rectangleOffset.width : nil,
                               height: isPressing ? rectangleOffset.height : nil)
                
            }.offset(x: isPressing ? rectangleOffset.width : -100, y: isPressing ?  rectangleOffset.height : -170)
                .transition(.identity)
                .scaledToFill()
        }
    }
}

#Preview {
    Task_7()
}
