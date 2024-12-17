//
//  Task_6.swift
//  CustomComponentsSwiftUI
//
//  Created by Vika on 17.12.2024.
//

import SwiftUI

struct Task_6: View {
    @State private var horizontal: Bool = true
    private let countRectangle = 7
    
    var body: some View {
        
        let layout = horizontal ? AnyLayout(HStackLayout()) : AnyLayout(DiagonalLayout())
        layout {
            ForEach(0 ..< countRectangle) { i in
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .onTapGesture {
            withAnimation {
                horizontal.toggle()
            }
        }
    }
}

struct DiagonalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let count = subviews.count
        let height = bounds.height / CGFloat(count)
        
        let wStep = (bounds.width - height) / CGFloat(count - 1)
        
        for (index,view) in subviews.enumerated() {
            view.place(
                at: .init(
                    x: CGFloat(index) * wStep + bounds.minX,
                    y: (bounds.maxY - height) - (height * CGFloat(index))),
                proposal: .init (width: height, height: height))
        }
    }
}

#Preview {
    Task_6()
}
