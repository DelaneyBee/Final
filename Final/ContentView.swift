//
//  ContentView.swift
//  Final
//
//  Created by Delaney Blaszinski on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    @State private var randomValue = 0
    @State private var turnScore = 0
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.green.opacity(0.7).ignoresSafeArea()
                    HStack {
                        Image("shopping \(randomValue)")
                            .resizable().frame(width: 170, height: 170)
                            .offset(x:-10, y: -100)
                            .rotationEffect(.degrees(rotation))
                           
                    }
                    
                    //All the decorations
                    ZStack {
                        Image("Red Peppermint").resizable().frame(width: 60, height: 60).offset(x: 150, y: -370)
                        Image("Red Peppermint").resizable().frame(width: 60, height: 60).offset(x: -150, y: -370)
                        Image("Red Candycane").resizable().frame(width: 190, height: 190).offset(x: -140, y: 300)
                        Image("Green CandyCane").resizable().frame(width: 190, height: 190).offset(x: 120, y: 300)
                        Image("Red Ornament").resizable().frame(width: 80, height: 80).offset(x: 30, y: -320)
                        Image("Blue Ornament").resizable().frame(width: 80, height: 80).offset(x: 100, y: -320)
                        Image("Red Ornament").resizable().frame(width: 80, height: 80).offset(x: -100, y: -320)
                        Image("Blue Ornament").resizable().frame(width: 80, height: 80).offset(x: -33, y: -320)
                    }
                    VStack {
                        Text("Guess The Price!").font(Font.custom("Times New Roman", size: 30)).bold().underline()
                        Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: -100)
                        Spacer()
                        Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: 120)
                        NavigationLink("About The Game", destination: InstructionsView())
                            .font(Font.custom("Times New Roman", size: 24))
                    }
                   
                    ZStack {
                        Button("Randomize") {
                            
                            chooseRandom(times: 3)
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation += 360
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                    .offset(x: -4, y: 270)
                    
                }
            }
        }
    }
    struct InstructionsView: View {
        var body: some View {
            ZStack {
                Color.green.opacity(0.7).ignoresSafeArea()
                VStack {
                    
                    Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: -225)
                        .padding()
                    Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: 130)
                }
                ZStack {
                    Image("Presents 1").resizable().frame(width: 100, height: 100).offset(x: 0, y: -120)
                    Image("Presents 2").resizable().frame(width: 100, height: 100).offset(x: 70, y: -120)
                    Image("Presents 2").resizable().frame(width: 100, height: 100).offset(x: -70, y: -120)
                    Image("Wreath").resizable().frame(width: 200, height: 200).offset(x: 10, y: 130)
                    Image("Holly").resizable().frame(width: 100, height: 100).offset(x: -100, y: 160)
                    Image("Holly").resizable().frame(width: 100, height: 100).offset(x: 100, y: 160)
                }
                VStack {
                    Text("Instructions").font(Font.custom("Times New Roman", size: 30)).bold()
                    Spacer()
                    VStack {
                        Text("To win: a player must guess the correct price of a present out of three prices.")
                            .font(Font.custom("Times New Roman", size: 25))
                            .padding()
                        Text("Points are counted based on number of correct guesses.").offset(x: 0, y: -25)
                            .font(Font.custom("Times New Roman", size: 25))
                        
                        Spacer()
                        VStack {
                            NavigationLink("Info On The Presents", destination: InstructionsView2()).font(Font.custom("Times New Roman", size: 30)).bold()
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
    }
    struct InstructionsView2: View {
        var body: some View {
            ZStack {
                Color.green.opacity(0.7).ignoresSafeArea()
            }
        }
    }
    
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...4)
                chooseRandom(times: times - 1)
            }
        }
        if times == 0 {
            if randomValue == 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                }
            }
        }
    }
  
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 100)
                .font(Font.custom("Times New Roman", size: 20))
                .padding()
                .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              
        }
    }
        
    
}
    #Preview {
        ContentView()
    }
    

