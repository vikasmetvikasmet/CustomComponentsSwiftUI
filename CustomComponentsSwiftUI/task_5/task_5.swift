//
//  task_5.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 15.12.2024.
//

import SwiftUI

struct Task_5: View {
    var dragView: some View {
        Rectangle()
            .clipShape(.rect(cornerRadius: 12))
            .frame(width: 100, height: 100)
    }
    
    @State var offset: CGSize = .zero
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .ignoresSafeArea()
            
            dragView.foregroundColor(.white)
                .blendMode(.difference)
                .overlay {
                    dragView.foregroundColor(.white)
                        .blendMode(.hue)
                }
                .overlay {
                    dragView.foregroundColor(.white)
                        .blendMode(.overlay)
                }
                .overlay {
                    dragView.foregroundColor(.black)
                        .blendMode(.overlay)
                }
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged({ value  in
                            offset = value.translation
                        })
                        .onEnded({ value in
                            withAnimation {
                                offset = .zero
                            }
                        })
                )
        }
    }
}
#Preview {
    Task_5()
}
