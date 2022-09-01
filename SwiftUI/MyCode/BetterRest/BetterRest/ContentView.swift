//
//  ContentView.swift
//  BetterRest
//
//  Created by Oscar Fridh on 2022-09-01.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    func test() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
    }
    
    func test2() {
        let someDate = Date.now
        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
    
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime.year().hour())
            Text(Date.now.formatted(date: .long, time: .shortened))
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
