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
    
    @FocusState private var inputFocus: Bool
    
    var result: String {
        let inputConverted: Double
        let outputConverted: Double
        
        switch fromUnit {
        case "Fahrenheit":
            inputConverted = (inputValue - 32) * 5 / 9
        case "Kelvin":
            inputConverted = (inputValue - 273.15)
        default:
            inputConverted = inputValue
        }
        
        switch toUnit {
        case "Fahrenheit":
            outputConverted = (inputConverted * 9 / 5) + 32
        case "Kelvin":
            outputConverted = (inputConverted + 273.15)
        default:
            outputConverted = inputConverted
        }
        
        return "\(outputConverted)"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFocus)
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
                    Text(result)
                }
                
            }
            .navigationTitle("Temperature Conversion")
            .toolbar {
                if inputFocus {
                    Button("Done") {
                        inputFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
