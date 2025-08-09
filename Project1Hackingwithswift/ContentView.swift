//
//  ContentView.swift
//  Project1Hackingwithswift
//
//  Created by Juan Hubert Liem on 09/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var amountofpeople = 2
    @State private var percenttips = 10
    let percentagetips = [10, 20, 50, 100]
    
    var totalperson: Double {
        let totalbill = Double(amount)
        let totalperson = Double(amountofpeople)+2
        let percentage = Double(percenttips)
        let tips = totalbill * (percentage/100)
        let grandtotal = totalbill + tips
        let amontperperson = grandtotal/totalperson
        
        return amontperperson
        
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    Picker("Total of People", selection: $amountofpeople ){
                        ForEach(2..<100)
                        {
                            Text("\($0) people")
                        }
                    }
                }
                    Section{
                        Picker("Tip", selection: $percenttips)
                        {
                            ForEach(percentagetips, id: \.self)
                            {
                                Text("\($0)%")
                            }
                            
                        }
                        .pickerStyle(.segmented)
                    }
                Section{
                    Text("\(totalperson)")
                }
                
            }
            .navigationTitle("We Spilt")
        }
        
    }
}

#Preview {
    ContentView()
}
