//
//  ContentView.swift
//  naranjamarilla
//
//  Created by aldoarias.figueroa on 7/18/20.
//  Copyright © 2020 aldoarias.figueroa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAnimation = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            HeaderView()
                .blur(radius: showAnimation ? 20 : 0)
                .animation(.default)
            
            BackCardView()
                .background(Color(showAnimation ? "card3" : "card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: showAnimation ? -360 : -40)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .scaleEffect(0.90)
                .rotationEffect(.degrees(showAnimation ? 0 : 10))
                .rotation3DEffect(.degrees(showAnimation ? 5 : 0), axis: (x:10.0, y: 0, z:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .background(Color(showAnimation ? "card4" :"card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: showAnimation ? -180 :-20)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(showAnimation ? 0 : 5))
                .rotation3DEffect(.degrees(showAnimation ? 0 : 5), axis: (x:10.0, y: 0, z:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .offset(x: self.viewState.width, y: self.viewState.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showAnimation.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged{value in
                            self.viewState = value.translation
                            self.showAnimation = true
                        }
                        .onEnded { value in
                            self.viewState = CGSize.zero
                            self.showAnimation = false
                        }
                )
            BottomView()
            .blur(radius: showAnimation ? 20 : 0)
            .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Deleihuate")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Sistema Nervioso")
                        .font(.subheadline)
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Bienvenidos")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
            
        }
    }
}

struct BottomView: View {
    var body: some View {
        VStack (spacing: 20) {
            Rectangle()
                .frame(width: 40.0, height: 5.0)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Aldo Arias has achieved the UI Desingcourse with approval from Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
         
    }
}
