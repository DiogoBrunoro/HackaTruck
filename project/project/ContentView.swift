//
//  ContentView.swift
//  project
//
//  Created by Turma01-7 on 03/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HeartBitView()
                .tabItem {
        Image(systemName: "heart.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
         Text("HeartBit")
                }
        CalcIMCView()
                .tabItem {
                    Image(systemName: "scalemass.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                     Text("IMC")
                }
            FormView()
                .tabItem{
                    Image(systemName: "list.bullet.clipboard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                     Text("Ficha Médica")
                }
                
        }.accentColor(.black)
    }
}

#Preview {
    ContentView()
}
