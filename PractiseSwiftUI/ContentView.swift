
//  ContentView.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    
    var body: some View {
        
        NavigationView {
            List(restaurants){
                restaurant in
                
                ZStack{
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        EmptyView()
                    }
                    
                    WideRestaurantCell(restaurant: restaurant)
                }
            }
            .navigationBarTitle("Restaurants", displayMode: .automatic)
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}


struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(restaurant.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            
            presentationMode.wrappedValue.dismiss()
            
        }){
            Image(systemName: "chevron.left.circle.fill")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
        })
        
    }
}
