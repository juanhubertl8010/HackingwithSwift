//
//  Hackingwithswift2.swift
//  Project1Hackingwithswift
//
//  Created by Juan Hubert Liem on 09/08/25.
//

import SwiftUI

struct Hackingwithswift2: View {
    @State private var inputSecond = 0
    @State private var selectedconvert = "Minutes"
    
    var output:Double {
        let second = Double(inputSecond)
        switch selectedconvert {
        case "Minutes":
            return second / 60
        case "Hours":
            return second / 3600
        case "Days":
            return second / 86400
        default:
            return 0
        }
    }
    var convertions = ["Minutes", "Hours", "Days"]
    var body: some View {
        NavigationStack{
            Form{
                Section("INPUT SECOND"){
                    TextField("Input seconds", value: $inputSecond, format: .number)
                }
                Section {
                    Picker("Convert to", selection: $selectedconvert) {
                        ForEach(convertions, id: \.self) { text in
                            Text(text)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section{
                    Text(output, format: .number.precision(.fractionLength(0)))

                }
            }
            .navigationTitle("Time Conversion")
        }
     
    }
}

#Preview {
    Hackingwithswift2()
}
