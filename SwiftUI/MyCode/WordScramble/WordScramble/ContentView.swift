//
//  ContentView.swift
//  WordScramble
//
//  Created by Oscar Fridh on 2022-09-04.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Text("Static Row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
            
            if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
                Text("Found file! \(fileURL)")
                if let fileContents = try? String(contentsOf: fileURL) {
                    Text(fileContents)
                }
            }
            
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
