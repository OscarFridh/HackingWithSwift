//
//  ContentView.swift
//  BetterRest
//
//  Created by Oscar Fridh on 2022-09-01.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    DatePicker("Please enter a time", selection: $viewModel.wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper("\(viewModel.sleepAmount.formatted()) hours", value: $viewModel.sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    Picker("Number of cups", selection: $viewModel.coffeeAmount) {
                        ForEach(1...20, id: \.self) { cups in
                            Text("\(cups)").tag(cups)
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section {
                    Text(viewModel.idealBedtime)
                        .font(.title)
                } header: {
                    Text("Your ideal bedtime is...")
                        .font(.headline)
                }
                
            }
            .navigationTitle("BetterRest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
