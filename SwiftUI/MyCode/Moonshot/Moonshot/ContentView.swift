//
//  ContentView.swift
//  Moonshot
//
//  Created by Oscar Fridh on 2022-10-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8, height: 300)
                .background(Color.green)
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
