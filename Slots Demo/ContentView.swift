//
//  ContentView.swift
//  Slots Demo
//
//  Created by Ginger on 22/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Credits: \(credits)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                VStack {
                    // Row 1
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        
                        Spacer()
                    }
                    // Row 2
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }
                    // Row 3
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        // Button
                        Button(action: {
                            pullLevel(betAmount: betAmount)
                            
                            if (checkWinnings(index: [3, 4, 5])) {
                                credits += betAmount
                            }
                        }) {
                            Text("Spin")
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        
                        Text("5 credits")
                    }
                    
                    VStack {
                        // Button
                        Button(action: {
                            pullLevel(betAmount: betAmount * 3)
                            
                            if (checkWinnings(index: [0, 1, 2])) {
                                credits += betAmount * 5
                            }
                            
                            if (checkWinnings(index: [3, 4, 5])) {
                                credits += betAmount * 5
                            }
                            
                            if (checkWinnings(index: [6, 7, 8])) {
                                credits += betAmount * 5
                            }
                        }) {
                            Text("Rows Spin")
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        
                        Text("15 credits")
                    }
                    
                    VStack {
                        // Button
                        Button(action: {
                            pullLevel(betAmount: betAmount * 10)
                            
                            if (checkWinnings(index: [0, 1, 2])) {
                                credits += betAmount * 10
                            }
                            
                            if (checkWinnings(index: [3, 4, 5])) {
                                credits += betAmount * 10
                            }
                            
                            if (checkWinnings(index: [6, 7, 8])) {
                                credits += betAmount * 10
                            }
                            
                            if (checkWinnings(index: [0, 4, 8])) {
                                credits += betAmount * 10
                            }
                            
                            if (checkWinnings(index: [2, 4, 6])) {
                                credits += betAmount * 10
                            }
                        }) {
                            Text("Max Spin")
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        
                        Text("50 credits")
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func pullLevel(betAmount: Int) {
        // Set backgrounds to white
        backgrounds = backgrounds.map { _ in
            Color.white
        }

        credits -= betAmount
        
        numbers = numbers.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    func checkWinnings(index: [Int]) -> Bool {
        if numbers[index[0]] == numbers[index[1]] && numbers[index[1]] == numbers[index[2]] {
            
            // Update backgrounds to green
            backgrounds[index[0]] = Color.green
            backgrounds[index[1]] = Color.green
            backgrounds[index[2]] = Color.green
            
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
