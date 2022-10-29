
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
            List{
                ForEach(restaurants){
                    restaurant in
                    
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        
                        RestaurantCell(restaurant: restaurant)
                    }
                }
                
            }.navigationBarTitle("Restaurants", displayMode: .automatic)
        }
    }
    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .black
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}


struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        VStack {
            
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
    }
}
