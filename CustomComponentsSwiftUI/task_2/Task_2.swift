//
//  Task_2.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 03.12.2024.
//

import SwiftUI

struct Task_2: View {
    @State private var widthRectangle = 300.0
    
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.red, lineWidth: 1)
                .frame(width: widthRectangle)
                .frame(height: 200)
                
                .overlay(
                    overlayContent
                )
            Slider(value: $widthRectangle, in: 100...300, step: 50.0)
                .padding(10)
        }
    }
    private var overlayContent: some View {
        VStack {
            titleView
            subtitleView
        }.frame(maxWidth: .infinity, alignment: .center)
        
    }
    
    private var titleView: some View {
        HStack(spacing: 0) {
            Text("Марафон ")
                .font(.system(size: 10))
                .foregroundColor(.gray) +
            Text("по")
                .font(.system(size: 20)) +
            Text(" SwiftUI")
                .font(.system(size: 20))
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 5)
           
    }
    private var subtitleView: some View {
        VStack {
            Text("«Отцовский пинок»")
                .foregroundStyle(Color.blue)
                .bold()
                .font(.system(size: 25))
            
            
        }.frame(maxWidth: .infinity, alignment: .center)
        
    }
}

#Preview {
    Task_2()
}
