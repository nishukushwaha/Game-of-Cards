//
//  ContentView.swift
//  uitest
//
//  Created by Nishant  Kushwaha on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard="back"
    @State var cpuCard="back"
    
    @State var playerScore:Int = 0
    @State var cpuScore:Int = 0
    @State var disableButton:Bool = false
    
    
    var more:Int {
        if (15-cpuScore < 15-playerScore) {
            return 15-cpuScore
        }
        else if(cpuScore==playerScore)
        {
            return 15-playerScore
        }
        else
        {
            return 15-playerScore
        }
    
    }
    
    var win:String {
        if (15-cpuScore < 15-playerScore) {
            return "CPU"
        }
        else if(cpuScore==playerScore)
        {
            return "Both"
        }
        else
        {
            return "Player"
        }
    
    }
    
    
    
    
    
    
    
    var body: some View {
        
        ZStack {
            
            Image("background").ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                
                
                VStack {
                    if(disableButton==false){
                    Button(action:
                            {
                                //generate random number 2-14
                                
                                let playerRandom=Int.random(in: 2...14)
                                let cpuRandom = Int.random(in: 2...14)
                                
                                //Card Update
                                playerCard="card"+String(playerRandom)
                                cpuCard="card"+String(cpuRandom)
                                
                                
                                //Score Udate
                                if(playerRandom<cpuRandom)
                                {
                                    
                                    cpuScore=cpuScore+1
                                    print(win)
                                    print(more)
                                }
                                else
                                {
                                    
                                    playerScore=playerScore+1
                                    print(win)
                                    print(more)
                                }
                                
                                //button update
                                
                                if(more==0)
                                {
                                    disableButton=true
                                }
                                
                                
                                
                        
                    }, label: {
                        HStack {
                            Image("dealbutton")
                                
                        }
                }).disabled(disableButton)
                    }
                    
                    
                    else if(disableButton==true)
                    {
                        Button(action: {
                            
                            playerScore=0
                            cpuScore=0
                            disableButton=false
                            
                            
                        }, label: {
                            Text("Restart").foregroundColor(.yellow).font(.largeTitle)
                        })
                    }
                }
                
                
                
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        VStack{
                            
                            Text("Player").font(.headline).foregroundColor(.white).padding(.bottom)
                            
                            Text(String(playerScore)).font(.largeTitle).foregroundColor(.white)
                            
                        }
                        Spacer()
                        VStack{
                            
                            Text("CPU").font(.headline).foregroundColor(.white).padding(.bottom)
                            
                            Text(String(cpuScore)).font(.largeTitle).foregroundColor(.white)
                            
                        }
                        Spacer()
                        
                        
                    }.padding()
                    
                    
                    if(more>0) {
                        HStack {
                            Text(win)
                            Text("needs more")
                            Text(String(more))
                            Text("to win")
                            }
                        
                    }
                    else
                    {
                        HStack{
                            Text(win)
                            Text("Wins")
                            
                        }.font(.title)
                        .foregroundColor(.white)
                    }
                    
                    
                    
                }
                
                
                
                Spacer()
                
            }
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
