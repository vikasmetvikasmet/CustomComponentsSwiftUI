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
                if isPressing {
                    Text("Open")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                        .font(.headline)
                        .opacity(isPressing ? 1 : 0)
                        .frame(width: rectangleOffset.width, height: rectangleOffset.height)
                } else {
                    Label("Back", systemImage: "arrowshape.backward.fill")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .font(.headline)
                        .opacity(isPressing ? 0 : 1)
                }
            }.offset(x: isPressing ? rectangleOffset.width : -100, y: isPressing ?  rectangleOffset.height : -170)
        }
    }
}

#Preview {
    Task_7()
}
