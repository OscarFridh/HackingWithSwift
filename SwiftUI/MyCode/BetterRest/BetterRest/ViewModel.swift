//
//  ViewModel.swift
//  BetterRest
//
//  Created by Oscar Fridh on 2022-09-03.
//

import Combine
import CoreML

class ViewModel: ObservableObject {
    @Published var wakeUp = ViewModel.defaultWakeTime {
        didSet {
            calculateBedtime()
        }
    }
    
    @Published var sleepAmount = 8.0 {
        didSet {
            calculateBedtime()
        }
    }
    
    @Published var coffeeAmount = 1 {
        didSet {
            calculateBedtime()
        }
    }
    
    init() {
        calculateBedtime()
    }
    
    private func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let component = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (component.hour ?? 0) * 60 * 60
            let minute = (component.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            idealBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            idealBedtime = "Sorry, there was a problem calculating your bedtime."
        }
    }
    
    @Published var idealBedtime: String = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
}
