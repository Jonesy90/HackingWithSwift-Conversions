//
//  ContentView.swift
//  HackingWithSwift-Conversions
//
//  Created by Michael Jones on 25/05/2026.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var fromUnit: String = "Celsius" //The base temperature unit that is going to be converted.
    //@State private var toUnit: String = "Fahrenheit" //The temperature unit to be converted into.
    
    @State private var fromUnit = UnitTemperature.celsius
    @State private var toUnit = UnitTemperature.fahrenheit
    
    @State private var inputValue: Double = 0 //The input value that has a @Binding on the TextField. This value id going to be converted.
    
    //var temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"] //String Array of Temperature Units available to be converted.
    let temperatureUnits: [UnitTemperature] = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    
    @FocusState private var inputFocus: Bool //A focus state property to handle when the keyboard is or is not in focus.
    
    //A computed property to convert the inputValue into Celsius and converting it to the choosen toUnit.
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
                        .focused($inputFocus) //Keeps an eye on the FocusState of the TextField.
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
            //A toolbar button to toggle the keyboard of the TextField, depending on the @FocusState.
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
