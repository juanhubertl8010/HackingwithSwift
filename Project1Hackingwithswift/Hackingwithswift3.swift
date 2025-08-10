//
//  Hackingwithswift3.swift
//  Project1Hackingwithswift
//
//  Created by Juan Hubert Liem on 10/08/25.
//

import SwiftUI

struct Hackingwithswift3: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Monaco", "Nigeria", "Poland", "Italy", "UK", "Spain", "US"].shuffled()
    @State private var selectedCountry = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correctAnswerCount = 0
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 300, endRadius: 400)
                .ignoresSafeArea()
            
            VStack (spacing: 20){
                Text("Tap the flag of")
                    .foregroundStyle(.white)
                Text(countries[selectedCountry])
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                ForEach(0..<3) { index in
                                    Button {
                                        // Aksi saat tombol ditekan
                                        flagTapped(index)
                                    } label: {
                                        Image(countries[index]) // gambar diambil dari Assets
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 5)
                                    }
                }
                
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(correctAnswerCount)")
        }
        
    }
    func flagTapped(_ index: Int) {
        if index == selectedCountry {
            scoreTitle = "Correct"
            correctAnswerCount += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        selectedCountry = Int.random(in: 0...2)
    }
}

#Preview {
    Hackingwithswift3()
}
