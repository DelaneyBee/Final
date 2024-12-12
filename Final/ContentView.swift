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
    @State private var Guess = ""
    @State private var PricePresOne = 200
    @State private var sliderValue = 0.0
    @State private var TextSlider = ""
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.green.opacity(0.7).ignoresSafeArea()
                    ZStack {
                        HStack {
                            Image("shopping \(randomValue)")
                                .resizable().frame(width: 170, height: 170)
                                .rotationEffect(.degrees(rotation))
                                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                            
                        }
                    }
                        ZStack {
                            Slider(value: $sliderValue, in: 1...6)
                            Text(TextSlider).frame(width: 130, height: 120).offset(x:0, y: -70)
                                .font(.title)
                                .padding()
                            Spacer()
                        }
                        .frame(width: 200, height: 190)
                        .offset(x: 0, y: -130)
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
                            chooseRandom(times: 5)
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
        .onChange(of: sliderValue) {
            switch sliderValue {
            case 0..<1:
                
                TextSlider = HowMuch0(language: "")
                break
            case 1..<2:
                TextSlider = HowMuch1(language: "")
                break
            case 2..<3:
               
                TextSlider = HowMuch2(language: "")
                break
            case 3..<4:
                
                TextSlider = HowMuch3(language: "")
                break
            case 4..<5:
               
               
                TextSlider = HowMuch4(language: "" )
                break
            case 5..<6:
                
                
                TextSlider = HowMuch5(langauge: "" )
                break
            default:
                break
            
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
    
    func HowMuch0(language: String) -> String {
       return "30"
    }
    
    func HowMuch1(language: String) -> String {
        return "$70"
    }
    
   
    func HowMuch2(language: String) -> String {
        return "$80"
    }
    
   
    func HowMuch3(language : String) -> String {
       return "$90"
    }
    
    
    func HowMuch4(language: String) -> String {
        return "$100"
    }
    
    
    func HowMuch5(langauge: String) -> String {
        return "$200"
    }
        
        
        
    
}
    #Preview {
        ContentView()
    }
    

