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
    @State private var sliderValue = 0.0
    
    @State private var TextSlider = ""
    @State private var moves = Array(repeating: "", count: 1)
    @State private var xTurn = true
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.green.opacity(0.7).ignoresSafeArea()
                    ZStack {
                        HStack {
                            Image("shopping \(randomValue)")
                                .resizable().frame(width: 160, height: 176)
                                .rotationEffect(.degrees(rotation))
                                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                        ZStack {
                            Slider(value: $sliderValue, in: 1...6)
                            Text(TextSlider).frame(width: 130, height: 120).offset(x:0, y: -70)
                               
                                .padding()
                            Spacer()
                        }
                        .frame(width: 200, height: 190).font(Font.custom("Times New Roman", size: 30))
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
                    VStack {
                        NavigationLink("Check Price", destination: InstructionsView3())
                       
                        
                    }
                    .offset(x:0, y: 180)
                    .buttonStyle(CustomButtonStyle())
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
                        Image("Presents 3").resizable().frame(width: 100, height: 100).offset(x: -5, y: -120)
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
                            Text("To win: a player must guess the correct price of the present out of the choices on the slider.")
                                .font(Font.custom("Times New Roman", size: 20))
                                .padding()
                            Text("To check if your guess is correct, click the 'check price' button.").multilineTextAlignment(.center)
                                .font(Font.custom("Times New Roman", size: 20))
                            
                            Spacer()
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            
                        }
                    }
                }
            }
        }
    
    struct InstructionsView3: View {
        func HeadPhonePrice(langauge: String) -> String {
            return "200"
        }
        func UggPrice(language: String) -> String {
            return "150"
        }
        func robePrice(language: String) -> String {
            return "80"
        }
        func BracePrice(language: String) -> String {
            return "90"
        }
        @State var sliderValue4 = 0.0
        @State var sliderValue5 = 0.0
        @State var sliderValue2 = 0.0
        @State var sliderValue3 = 0.0
        @State var TextSlider2 = ""
        @State var TextSlider3 = ""
        @State var TextSlider4 = ""
        @State var TextSlider5 = ""
        var body: some View {
           
            ZStack {
                Color.green.opacity(0.7).ignoresSafeArea()
                VStack {
                    
                    Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: -225)
                        .padding()
                    Image("Lights").resizable().frame(width: 400, height: 320).offset(x: 0, y: 160)
                }
                ZStack {
                    Image("Presents 1").resizable().frame(width: 100, height: 100).offset(x: 0, y: -120)
                    Image("Presents 2").resizable().frame(width: 100, height: 100).offset(x: 150, y: 350)
                    Image("Presents 2").resizable().frame(width: 100, height: 100).offset(x: -150, y: 350)
                    Image("Wreath").resizable().frame(width: 200, height: 200).offset(x: 0, y: -260)
                    Image("Holly").resizable().frame(width: 100, height: 100).offset(x: -100, y: -210)
                    Image("Holly").resizable().frame(width: 100, height: 100).offset(x: 100, y: -210)
                }
                ZStack {
                    Slider(value: $sliderValue2, in: 0...1)
                    Text(TextSlider2).frame(width: 130, height: 120).offset(x:-10, y: -30)
                         }
                .font(Font.custom("Times New Roman", size: 30)).offset(x:0, y:-80)
                .frame(width: 130, height: 120).offset(x:-120, y: 10)
                Image("shopping 1").resizable().frame(width :100, height :100).offset(x:-120, y:10)
                
                
                
                ZStack {
                    Slider(value: $sliderValue3, in: 0...1)
                    Text(TextSlider3).frame(width: 130, height: 120).offset(x:-10, y: 30)
                }
                .font(Font.custom("Times New Roman", size: 30)).offset(x:0, y:80)
                .frame(width: 130, height: 120).offset(x:-120, y: 170)
                Image("shopping 2").resizable().frame(width :100, height :100).offset(x:-120, y:170)
                
                ZStack {
                    Slider(value: $sliderValue4, in: 0...1)
                    Text(TextSlider4).frame(width: 130, height: 120 ).offset(x: -10, y: -30)
                }
                .font(Font.custom("Times New Roman", size: 30)).offset(x: 220, y:-80)
                .frame(width: 130, height: 120).offset(x:-120, y: 10)
                Image("shopping 3").resizable().frame(width :100, height :100).offset(x:120, y:10)
                
                ZStack {
                    Slider(value: $sliderValue5, in: 0...1)
                    Text(TextSlider5).frame(width: 130, height: 120 ).offset(x: 0, y: 0)
                }
                .font(Font.custom("Times New Roman", size: 30)).offset(x: 220, y:80)
                .frame(width: 130, height: 120).offset(x:-110, y: 170)
                Image("shopping 4").resizable().frame(width :100, height :100).offset(x:120, y:170)
            }
            
            
            
            .onChange(of: sliderValue2) {
                switch sliderValue2{
                case 0..<1:
                    TextSlider2 = HeadPhonePrice(langauge: "")
                    func HeadPhonePrice(langauge: String) -> String {
                        return "$200"
                    }
                default:
                    break
                }
            }
            .onChange(of: sliderValue3) {
                switch sliderValue3 {
                case 0..<1:
                    TextSlider3 = UggPrice(langauge: "")
                    func UggPrice(langauge: String) -> String {
                        return "$150"
                    }
                default:
                    break
                }
            }
            .onChange(of: sliderValue4) {
                switch sliderValue4 {
                case 0..<1:
                    TextSlider4 = robePrice(langauge: "")
                    func robePrice(langauge: String) -> String {
                        return "$70"
                    }
                default:
                    break
                }
            }
            .onChange(of: sliderValue5) {
                switch sliderValue5 {
                case 0..<1:
                    TextSlider5 = BracePrice(langauge: "")
                    func BracePrice(langauge: String) -> String {
                        return "$90"
                    }
                default:
                    break
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
       return "$100"
    }
    
    
    func HowMuch4(language: String) -> String {
        return "$150"
    }
    
    
    func HowMuch5(langauge: String) -> String {
        return "$200"
    }
        
    func HeadPhonePrice(langauge: String) -> String {
        return "200"
    }
        
    
}
    #Preview {
        ContentView()
    }
    

