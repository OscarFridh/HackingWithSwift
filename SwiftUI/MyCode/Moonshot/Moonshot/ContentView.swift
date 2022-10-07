//
//  ContentView.swift
//  Moonshot
//
//  Created by Oscar Fridh on 2022-10-06.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("\(astronauts.count) astronauts")
            Text("\(missions.count) missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
