//
//  ContentView.swift
//  Animations
//
//  Created by Oscar Fridh on 2022-09-14.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        //.animation(.interpolatingSpring(stiffness: 100, damping: 10), value: animationAmount)
        //.animation(.easeInOut(duration: 2), value: animationAmount)
        .animation(
            .easeInOut(duration: 2)
//                .delay(1),
//                .repeatCount(3, autoreverses: true),
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
