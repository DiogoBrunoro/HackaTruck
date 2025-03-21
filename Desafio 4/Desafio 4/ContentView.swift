//
//  ContentView.swift
//  Desafio 4
//
//  Created by Turma01-7 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            RosaView()
                .tabItem {
                    Label("Rosa" , systemImage: "paintbrush")
                }
            Azulview()
                .tabItem {
                    Label("Azul" , systemImage: "paintbrush.pointed")
                }
            CinzaView()
                .tabItem {
                    Label("Cinza" , systemImage: "paintpalette")
                }
            ListaView()
                .tabItem {
                    Label("Lista" , systemImage: "list.bullet")
                }
                
                }
        }
    }

#Preview {
    ContentView()
}
