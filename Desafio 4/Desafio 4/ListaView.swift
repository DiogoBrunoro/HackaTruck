//
//  ListaView.swift
//  Desafio 4
//
//  Created by Turma01-7 on 21/03/25.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    NavigationLink(destination: RosaView()){
                        Text("Rosa")}
                    Spacer()
                    Image(systemName: "paintbrush")
                }
                HStack{
                    NavigationLink(destination: Azulview()){
                        Text("Azul")}
                    Spacer()
                    Image(systemName: "paintbrush.pointed")
                }
                HStack{
                    NavigationLink(destination: CinzaView()){
                        Text("Cinza")}
                    Spacer()
                    Image(systemName: "paintpalette")
                }
            }.navigationTitle("List")
        }// navagationStack
    }
}

#Preview {
    ListaView()
}
