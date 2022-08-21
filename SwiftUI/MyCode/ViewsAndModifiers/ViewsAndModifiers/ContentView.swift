//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Oscar Fridh on 2022-08-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Some button") {
                // The VStack content is wrapped in a TyppeView so that types are preserved
                print(type(of: self.body))
            }
            Text("Another type of view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
