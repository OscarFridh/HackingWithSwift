//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Oscar Fridh on 2022-08-21.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
