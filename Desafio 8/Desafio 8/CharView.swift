//
//  CharView.swift
//  Desafio 8
//
//  Created by Turma01-7 on 26/03/25.
//

import SwiftUI

struct CharView: View {
    var person : HaPO
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                AsyncImage(url: URL(string : person.image!)) { image in
                    image
                        .resizable()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .padding(.bottom,50)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                
                Text(person.name!)
                    .padding(10)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 100)
                Text(person.gender!)
                    .padding(10)
                Text(person.house!)
                    .padding(10)
                
                
            }
        }
    }
}


