//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar Fridh on 2022-08-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Delete selection", role: .destructive, action: executeDelete)
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
