//
//  ContentView.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            HStack {
                VStack(alignment: .leading){
                    
                    Text("Monday, AUG 20")
                        .foregroundColor(.secondary)
                        .font(.body)
                    
                    Text("Your Reading")
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.black)
                }
                Spacer()
            }.padding(.horizontal)
            
            ScrollView( .horizontal, showsIndicators: false){
                
                HStack {
                    
                    Group{
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
                        
                    }.frame(width: 300)
                    
                }
            }
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
