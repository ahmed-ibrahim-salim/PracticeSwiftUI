//////
//////  CrazyAnimationTopToButtom.swift
//////  PractiseSwiftUI
//////
//////  Created by magdy khalifa on 26/10/2022.
//////
////
//import SwiftUI
//
//struct ContentView: View {
//    
//    var imageName: String = "cloud.rain"
//    @State private var isActive = false
//    @State private var xAxis: CGFloat = 0
//    var num: Int = 50
//    
//    var body: some View {
//
//        HStack {
//            VStack{
//                ForEach(0..<num) {_ in
//                    ButtonGenerator(imageName: imageName, xAxis: $xAxis, isActive: $isActive)
//                }
//            }
//        }
//        .onAppear(){
//            self.isActive = true
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct ButtonGenerator: View{
//
//    var imageName: String
//    @Binding var xAxis: CGFloat
//    @Binding var isActive: Bool
//    
//    var body: some View{
//        Button(action: {
//            
//        }) {
//            Image(systemName: imageName)
//        }
//        .offset(x: (xAxis + .random(in: -200...200)) , y: isActive ? 1000 : -1000)
//        .animation(Animation.linear(duration: 20))
//        .frame(width: .infinity, height: 30)
//    }
//}
//
