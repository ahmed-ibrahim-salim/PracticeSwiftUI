
//  ContentView.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDoneLoading = false
    @State private var isLoading = false
    @State private var startLoading = false

    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: isLoading ? 300 : 200 , height: 70)
                .foregroundColor(.green)
                .overlay(
                    HStack {
                        if isLoading{
                            Circle()
                                .trim(from: 0, to: 0.8)
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 40, height: 40)
                                .rotationEffect(Angle(degrees: startLoading ? 360 : 0))
                                .animation(Animation.default.repeatForever(autoreverses: false))
                            
                        }
                        Text(isLoading ? "Proccessing" : "submit")
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                ).onTapGesture {
                    withAnimation(.default){
                        self.isLoading.toggle()
                    }
                    self.startLoading.toggle()
//                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
//                        timer in
//
////                        if timer.
//                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

