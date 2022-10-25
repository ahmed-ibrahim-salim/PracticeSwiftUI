//
//  Chapter-6-buttons.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 25/10/2022.
//

import SwiftUI

struct Chapter_6_buttons: View {
    var body: some View {
        VStack{
            
            Button(action: {
                print("Hello World tapped!")
            }){
                Image(systemName: "plus")
                    
            }
            .buttonStyle(PlusBackgroundStyle())
           
            Button(action: {
                print("Hello World tapped!")
            }){
                HStack{
                    Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                print("Hello World tapped!")
            }){
                HStack{
                    Text("Edit")
                        .fontWeight(.semibold)
                        .font(.title)
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            Button(action: {
                print("Hello World tapped!")
            }){
                HStack{
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                    Image(systemName: "trash")
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
        }
    }
}



struct PlusBackgroundStyle: ButtonStyle{
    
    typealias Body = Button
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotationEffect(configuration.isPressed ? Angle(degrees: -90) : Angle(degrees: 0))
    }
}

struct GradientBackgroundStyle: ButtonStyle{
    
    typealias Body = Button
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct Chapter_6_buttons_Previews: PreviewProvider {
    static var previews: some View {
        Chapter_6_buttons()
    }
}
