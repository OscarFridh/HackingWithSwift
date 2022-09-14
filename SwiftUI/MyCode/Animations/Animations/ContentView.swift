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
        Button("Tap me") {
            withAnimation(
                .interpolatingSpring(stiffness: 5, damping: 1)
//                .easeInOut(duration: 1)
            ) {
                animationAmount += 180
            }
        }
        .padding(40)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
