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
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            Button("Button 5") {}
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button {
                print("Custom button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            Button {
                print("Edit button was tapped")
            } label: {
                //Image(systemName: "pencil")
                
                // Label is neater than HStack of image and label
                Label("Edit", systemImage: "pencil")
            }
        }
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
