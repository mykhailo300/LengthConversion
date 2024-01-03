//
//  ContentView.swift
//  Project1
//
//  Created by Михайло Дмитрів on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @State private var inputValue = 0.0
    var outputValue: Double {
        var inputInMeters: Double {
            switch inputUnit {
            case "km":
                return inputValue * 1000
            case "ft":
                return inputValue / 3.281
            case "yd":
                return inputValue / 1.094
            case "mi":
                return inputValue * 1609
            default:
                return inputValue
            }
        }
        switch outputUnit {
        case "km":
            return inputInMeters / 1000
        case "ft":
            return inputInMeters * 3.281
        case "yd":
            return inputInMeters * 1.094
        case "mi":
            return inputInMeters / 1609
        default:
            return inputInMeters
        }
        
    }
    @FocusState private var inputIsFocused: Bool
    
    let inputUnits = ["m", "km", "ft", "yd", "mi"]
    let outputUnits = ["m", "km", "ft", "yd", "mi"]

    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose an input unit") {
                    Picker("Input", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Choose an output unit") {
                    Picker("Output", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(inputUnit) {
                    TextField("Input", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                Section(outputUnit) {
                    Text(outputValue, format: .number)
                    
                }
            }
            .navigationTitle("Length conversion")
            .toolbar  {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

