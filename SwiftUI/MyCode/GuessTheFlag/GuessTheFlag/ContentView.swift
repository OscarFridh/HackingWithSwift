//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar Fridh on 2022-08-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .red, location: 0.45),
            .init(color: .green, location: 0.75)
        ]), startPoint: .top, endPoint: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
