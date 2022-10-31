//
////  ContentView.swift
////  PractiseSwiftUI
////
////  Created by magdy khalifa on 25/10/2022.
////
//
//import SwiftUI
//
//struct ContentView: View {
//
//    @State private var index = 0
//    @State var selectedCard: Card?
//
//
//    var body: some View {
//
//        NavigationView{
//
//            List(cardViews, id: \.id){ card in
//
//                CardView(card: card)
//                    .onTapGesture {
//                        self.selectedCard = card
//                    }
//
//            }
//            .sheet(item:  $selectedCard){ card in
//                CardDetailView(card: card)
//            }
//            .navigationBarTitleDisplayMode(.large)
//            .navigationBarTitle("Home")
//            .padding(.horizontal, -20)
//        }
//
//    }
//}
//
//
//
//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct CardDetailView: View{
//
//    @State private var showAlert = false
//    @Environment(\.presentationMode) var presentationMode
//    var card: Card
//
//    var body: some View {
//
//        ScrollView(.vertical, showsIndicators: false){
//
//            VStack(alignment: .leading){
//                Image(card.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//
//                Group{
//                    Text(card.heading)
//                        .font(.system(.title, design: .rounded))
//                        .fontWeight(.black)
//                        .lineLimit(3)
//                        .padding(.bottom, 0)
//
//                    Text("By \(card.author)".uppercased())
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                        .padding(.bottom, 0)
//
//                    HStack(spacing: 3) {
//                        ForEach(1...(card.rating), id: \.self) { _ in
//                            Image(systemName: "star.fill")
//                                .font(.caption)
//                                .foregroundColor(.yellow)
//                        }
//                    }
//
//                    Text(card.excerpt)
//                        .font(.system(.body))
//
//                }.padding(.horizontal)
//            }
//        }.overlay(
//            HStack{
//                Spacer()
//
//                VStack{
//                    Button(action: {
//
//                        self.showAlert = true
//
////                        presentationMode.wrappedValue.dismiss()
//                    }, label: {
//                        Image(systemName: "chevron.down.circle.fill")
//                            .font(.system(.largeTitle))
//                            .foregroundColor(Color.white)
//
//                    })
//                    .padding()
//
//
//                    Spacer()
//                }
//            }
//        )
//        .alert(isPresented: $showAlert){
//
//            Alert(title: Text("Reminder"),
//                  message: Text("Are you sure ?"),
//                  primaryButton: .default(Text("Yes"),
//                                          action: {self.presentationMode.wrappedValue.dismiss()}),
//                  secondaryButton: .cancel(Text("No")))
//        }
//        .edgesIgnoringSafeArea(.top)
//    }
//}
//
//struct CardView: View {
//
//
//    var card: Card
//
//    var body: some View {
//        VStack{
//            Image(card.image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            VStack(alignment: .leading) {
//
//                Text(card.category)
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//
//                Text(card.heading)
//                    .font(.title)
//                    .fontWeight(.black)
//                    .foregroundColor(.primary)
//                    .lineLimit(3)
//                    .minimumScaleFactor(0.5)
//
//                Text(card.author.uppercased())
//                    .font(.caption)
//
//                Text(card.excerpt.uppercased())
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//
//            }.padding(.horizontal)
//
//        }
//        .cornerRadius(10)
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
//        )
//    }
//}
//
