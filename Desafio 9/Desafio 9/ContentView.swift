//
//  ContentView.swift
//  Desafio 9
//
//  Created by Turma01-7 on 27/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(spacing : 16){
                    ScrollView{
                        ForEach(viewModel.pais, id: \.self) { lugar in
                            NavigationLink(destination: PaisView(country : lugar)){
                                VStack(spacing : 18){
                                    HStack{
                                        AsyncImage(url: URL(string : lugar.bandeira!)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 40)
                                                .clipShape(RoundedRectangle(cornerRadius: 0))
                                        } placeholder: {
                                            Image(systemName: "photo.fill")
                                        }
                                        VStack{
                                            Text(lugar.nome!)
                                                .frame(maxWidth: .infinity, alignment:
                                                        .leading)
                                            Text(lugar.continente!)
                                                .frame(maxWidth: .infinity, alignment:
                                                        .leading)
                                        }
                                    }.padding(.leading,30)
                                        .shadow(radius: 20)
                                }.padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                            }.tint(.black)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading) // <- ADDED
                }.padding()
            }.onAppear(perform : viewModel.fatch)
        }
    }
}

#Preview {
    ContentView()
}
