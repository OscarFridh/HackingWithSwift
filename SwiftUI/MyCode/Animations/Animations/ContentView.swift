//
//  ContentView.swift
//  Animations
//
//  Created by Oscar Fridh on 2022-09-14.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.myPivot)
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

struct CornerRotateFadeModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .opacity(opacity)
        
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
    
    static var myPivot: AnyTransition {
        .modifier(
            active: CornerRotateFadeModifier(amount: -90, anchor: .topLeading, opacity: 0),
            identity: CornerRotateFadeModifier(amount: 0, anchor: .topLeading, opacity: 1)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
