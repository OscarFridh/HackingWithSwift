//
//  ContentView.swift
//  Day19Challenge
//
//  Created by Oscar Fridh on 2022-08-18.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature: Double = 20
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var celsius: Double {
        switch inputUnit {
        case "Celsius": return temperature
        case "Fahrenheit": return (temperature - 32) / 1.8
        case "Kelvin": return temperature - 273.15
        default: fatalError("Unexpected unit")
        }
    }
    
    var fahrenheit: Double {
        (celsius * 1.8) + 32
    }
    
    var kelvin: Double {
        celsius + 273.15
    }
    
    var output: Double {
        switch outputUnit {
        case "Celsius": return celsius
        case "Fahrenheit": return fahrenheit
        case "Kelvin": return kelvin
        default: fatalError("Unexpected unit")
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature",
                              value: $temperature,
                              format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Enter temperature")
                }
                
                Section {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(output, format: .number.precision(.fractionLength(2)))
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Temperature")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
