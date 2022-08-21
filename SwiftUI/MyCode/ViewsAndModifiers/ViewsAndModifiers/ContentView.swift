//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Oscar Fridh on 2022-08-21.
//

import SwiftUI

struct ContentView: View {
    
    
    var motto1: some View {
        Text("Draco dorminens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder
    var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
            spells
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
