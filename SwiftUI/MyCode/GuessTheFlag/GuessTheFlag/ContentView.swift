//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar Fridh on 2022-08-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("A")
                Text("B")
                Text("C")
            }
            HStack {
                Text("D")
                Text("E")
                Text("F")
            }
            HStack {
                Text("G")
                Text("H")
                Text("I")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
