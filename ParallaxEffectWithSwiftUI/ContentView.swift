//
//  ContentView.swift
//  ParallaxEffectWithSwiftUI
//
//  Created by Ramill Ibragimov on 21.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .colorInvert()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Parallax Effect")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 80)
                VStack {
                    Image(systemName: "swift")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                        .shadow(color: .blue, radius: 30, x: 5.0, y: 5.0)
                }.rotation3DEffect(
                    .degrees(animate1 ? 16 : -16),
                    axis: (x: animate1 ? 90 : -45, y: animate1 ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 3.6).repeatForever(autoreverses: true))
                .onAppear() {
                    animate1.toggle()
                }.padding(30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
