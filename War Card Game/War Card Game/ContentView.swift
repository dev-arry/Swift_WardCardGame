//
//  ContentView.swift
//  War Card Game
//
//  Created by Arghaya Singh on 6.10.2026.
//

import SwiftUI

struct ContentView: View {
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "card2"
    @State var cpuCard = "card4"
    @State var playerCardIndex = 2
    @State var cpuCardIndex = 4
    @State var background = "background2"
    @State var backgroundIndex = 1
    @State var backgroundTimer = 0
    var body: some View {
        
        ZStack(){
            Image(background)
            VStack(){
                Spacer()
                Image("logo")
                Spacer() //spacer is better than spacing because it will work for all apple layouts
                
                HStack(){
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button(){
                    print("Button clicked")
                    buttonPressed()
                    
                } label:{
                    Image("button")
                }
                Spacer()
                
                HStack(){
                    Spacer()
                    VStack(){
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)//the .bottom, .top and many more for padding
                        Text(String(playerScore))
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                    VStack(){
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(Color.white)
                Spacer()
                //.padding()
                
            }
        }
    }
    
    func buttonPressed(){
        playerCardIndex = Int.random(in:2...14) //remember this for random number within a range
        cpuCardIndex = Int.random(in:2...14)
        backgroundIndex = Int.random(in:1...4)
        
        playerCard = "card" + String(playerCardIndex)
        cpuCard = "card" + String(cpuCardIndex) //u can put certain int or the other way around in string or int
        
        print(cpuCardIndex)
        print(playerCardIndex)
        print(backgroundIndex)
        
        backgroundTimer += 1
        
        if playerCardIndex > cpuCardIndex{
            playerScore += 1
        } else if cpuCardIndex > playerCardIndex{
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }
        
        if backgroundTimer >= 4{
            background = "background" + String(backgroundIndex)
            backgroundTimer = 0
        } else {
            print("no change yet")
        }
    }
}

#Preview {
    ContentView()
}
