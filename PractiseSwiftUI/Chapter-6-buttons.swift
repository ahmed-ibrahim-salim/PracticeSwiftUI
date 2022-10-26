//
//  Chapter-6-buttons.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 25/10/2022.
//

import SwiftUI

struct Chapter_6_buttons: View {
    
    @State private var isPlaying = false
    
    var body: some View {
        Button(action: {
            
            self.isPlaying.toggle()
            
        }){
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill") .font(.system(size: 150))
            .foregroundColor(isPlaying ? .red : .green)
        }
        
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
