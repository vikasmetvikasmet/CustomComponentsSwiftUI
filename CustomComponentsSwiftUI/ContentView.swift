//
//  ContentView.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    var numbers: [Int] = Array(1...100)
    var body: some View {
        TabView {
            ScrollView {
                LazyVStack {
                    ForEach(numbers, id: \.self) { number in
                        NumberView(number: number)
                    }
                }
            }.safeAreaInset(edge: .bottom, spacing: 0) {
                BottomBar()
            }
            .tabItem {
                Label("First", systemImage: "star.fill")
            }
        }
    }
}

struct NumberView: View {
    let number: Int
    var body: some View {
        Text("\(number)")
            .foregroundColor(.gray)
            .font(.system(size: 30))
            .opacity(0.5)
    }
}
struct BottomBar: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .foregroundStyle(Color.red)
            .opacity(0.5)
    }
}

#Preview {
    ContentView()
}
