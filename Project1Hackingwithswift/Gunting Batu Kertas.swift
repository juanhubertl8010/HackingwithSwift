//
//  Gunting Batu Kertas.swift
//  Project1Hackingwithswift
//
//  Created by Juan Hubert Liem on 10/08/25.
//

import SwiftUI

struct Gunting_Batu_Kertas: View {
    @State private var pilihan = ["Gunting", "Batu", "Kertas"]
    @State private var requirement = ["Win", "Lose"]
    @State private var pilihancpu = Int.random(in: 0..<3)
    @State private var selectedrequirement = Int.random(in: 0..<2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 300, endRadius: 400)
            .ignoresSafeArea()
            VStack{
                Text("CPU CHOOSE")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Image(pilihan[pilihancpu])
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("You Must")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(requirement[selectedrequirement])
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .foregroundColor(.white)
                ForEach(0..<3) { index in
                    Button {
                        // Aksi saat tombol ditekan
                        playertapped(index)
                    } label: {
                        Image(pilihan[index]) // gambar diambil dari Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 5)
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
        }
    }
    func playertapped(_ index: Int) {
        if pilihancpu == 0 && selectedrequirement == 0{
            if index != 1{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 0 && selectedrequirement == 0{
            if index == 1{
                scoreTitle = "You Corret"
            }
        }
        if pilihancpu == 0 && selectedrequirement == 1{
            if index != 2{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 0 && selectedrequirement == 1{
            if index == 2{
                scoreTitle = "You Corret"
            }
        }
        if pilihancpu == 1 && selectedrequirement == 0{
            if index != 2{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 1 && selectedrequirement == 0{
            if index == 2{
                scoreTitle = "You Corret"
            }
        }
        if pilihancpu == 1 && selectedrequirement == 1{
            if index != 0{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 1 && selectedrequirement == 1{
            if index == 0{
                scoreTitle = "You Corret"
            }
        }
        if pilihancpu == 2 && selectedrequirement == 0{
            if index != 0{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 2 && selectedrequirement == 0{
            if index == 0{
                scoreTitle = "You Corret"
            }
        }
        if pilihancpu == 2 && selectedrequirement == 1{
            if index != 1{
                scoreTitle = "You Wrong"
            }
        }
        if pilihancpu == 0 && selectedrequirement == 1{
            if index == 1{
                scoreTitle = "You Corret"
            }
        }
        if scoreTitle == "You Corret"{
            score += 1
        }
        showingScore = true
    }
    func askQuestion() {
       pilihancpu = Int.random(in: 0..<3)
        selectedrequirement = Int.random(in: 0..<2)
    }
    
}

#Preview {
    Gunting_Batu_Kertas()
}
