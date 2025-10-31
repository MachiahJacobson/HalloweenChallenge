//
//  ContentView.swift
//  HalloweenChallenge
//
//  Created by Jacobson, Machiah - Student on 10/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedEyes = "eyes1"
    @State private var selectedNose = "nose1"
    @State private var selectedMouth = "mouth1"
    
    let eyesOptions = ["eyes1", "eyes2", "eyes3"]
    let noseOptions = ["nose1", "nose2", "nose3"]
    let mouthOptions = ["mouth1", "mouth2", "mouth3"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.orange.opacity(0.9)]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("🎃 Pumpkin Carving 🎃")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                
                ZStack {
                    Circle()
                        .fill(Color.myOrange)
                        .frame(width: 250, height: 250)
                        .shadow(color: .orange, radius: 20)
                    
                    Image(selectedEyes)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 70)
                        .offset(y: -60)
                    
                    Image(selectedNose)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Image(selectedMouth)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 50)
                        .offset(y: 50)
                }
                .overlay(
                    Circle()
                        .stroke(Color.orange.opacity(0.7), lineWidth: 5)
                )
                .shadow(radius: 10)
                .padding()
                
                VStack(spacing: 15) {
                    Menu("👀 Choose Eyes") {
                        ForEach(eyesOptions, id: \.self) { eye in
                            Button(action: { selectedEyes = eye }) {
                                Label(eye.capitalized, systemImage: "eye")
                            }
                        }
                    }
                    
                    Menu("👃 Choose Nose") {
                        ForEach(noseOptions, id: \.self) { nose in
                            Button(action: { selectedNose = nose }) {
                                Label(nose.capitalized, systemImage: "nose")
                            }
                        }
                    }
                    
                    Menu("👄 Choose Mouth") {
                        ForEach(mouthOptions, id: \.self) { mouth in
                            Button(action: { selectedMouth = mouth }) {
                                Label(mouth.capitalized, systemImage: "mouth")
                            }
                        }
                    }
                }
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                .background(Color.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
