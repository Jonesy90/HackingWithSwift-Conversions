//
//  ContentView.swift
//  HackingWithSwift-Conversions
//
//  Created by Michael Jones on 25/05/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromUnit: String = "Celsius"
    @State private var toUnit: String = "Fahrenheit"
    @State private var inputValue: Double = 0
    
    var temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedValue: Double {
        var value: Double = 0
        
        if fromUnit == "Celsius" {
            value = inputValue
        } else if fromUnit == "Fahrenheit" {
            value =  (inputValue - 32) * 5 / 9
        } else if fromUnit == "Kelvin" {
            value = (inputValue - 273.15)
        }
        
        return value
    }
    
    var outputValue: Double {
        var outputValue: Double = 0
        
        if toUnit == "Celsius" {
            outputValue = convertedValue
        } else if toUnit == "Fahrenheit" {
            outputValue = (convertedValue * 9 / 5) + 32
        } else if toUnit == "Kelvin" {
            outputValue = convertedValue + 273.15
        }
        
        return outputValue
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                }
                
                Section("From Temperature") {
                    Picker("From Temperature", selection: $fromUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To Temperature") {
                    Picker("From Temperature", selection: $toUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Value") {
                    Text("\(outputValue.formatted())")
                }
                
            }
            .navigationTitle("Temperature Conversion")
        }
    }
}

#Preview {
    ContentView()
}
