//
//  ContentView.swift
//  Desafio 8
//
//  Created by Turma01-7 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    AsyncImage(url: URL(string : "https://tm.ibxk.com.br/2021/05/02/02163114056022.jpg?ims=704x264")) { image in
                        image
                            .resizable()
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(.bottom,20)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                    ScrollView{
                        ForEach(viewModel.personagem, id: \.self) { char in
                            NavigationLink(destination: CharView(person : char)){
                                VStack{
                                    HStack{
                                        AsyncImage(url: URL(string : char.image!)) { image in
                                            image
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .padding(10)
                                        } placeholder: {
                                            Image(systemName: "photo.fill")
                                        }
                                        Text(char.name!)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }.padding(.leading,30)
                                        .shadow(radius: 20)
                                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                }
                            }.tint(.black)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading) // <- ADDED
                }
            }.onAppear(perform : viewModel.fatch)
        }
    }
}

#Preview {
    ContentView()
}
