//
//  Restaurant.swift
//  PractiseSwiftUI
//
//  Created by Ahmad medo on 29/10/2022.
//

import SwiftUI

struct WideRestaurantCell: View {

    var restaurant: Restaurant

    var body: some View {
        ZStack{
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}


struct RestaurantCell: View {

    var restaurant: Restaurant

    var body: some View {
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            Text(restaurant.name)
            
            Spacer()
        }
    }
}



struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}


var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                    Restaurant(name: "Homei", image: "homei"),
                    Restaurant(name: "Homei", image: "teakha"),
                    Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                    Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                    Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                    Restaurant(name: "Po's Atelier", image: "posatelier"),
                    Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                    Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                    Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                    Restaurant(name: "Upstate", image: "upstate"),
                    Restaurant(name: "Traif", image: "traif"),
                    Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                    Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                    Restaurant(name: "Five Leaves", image: "fiveleaves"),
                    Restaurant(name: "Cafe Lore", image: "cafelore"),
                    Restaurant(name: "Confessional", image: "confessional"),
                    Restaurant(name: "Barrafina", image: "barrafina"),
                    Restaurant(name: "Donostia", image: "donostia"),
                    Restaurant(name: "Royal Oak", image: "royaloak"),
                    Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
]
