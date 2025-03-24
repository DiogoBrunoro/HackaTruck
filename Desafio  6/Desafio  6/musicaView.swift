//
//  musicaView.swift
//  Desafio  6
//
//  Created by Turma01-7 on 24/03/25.
//

import SwiftUI

var arrayImagens = ["shuffle","backward.end.fill","play.fill","forward.end.fill","repeat"

]

struct musicaView: View {
    var musica : Song
    var body: some View {
        ZStack{
            LinearGradient(gradient : Gradient(colors : [.blue, .black]),startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                AsyncImage(url: URL(string : musica.capa)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                Text(musica.name)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                Text(musica.artist)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.bottom,100)
                HStack(spacing : 25){
                    ForEach(0..<arrayImagens.count, id: \.self) { i in
                            
                        if(i == 2){
                            Image(systemName: arrayImagens[i])
                            .resizable()
                            .frame(width: 60,height: 60)
                            .padding(20)
                        }else{
                            Image(systemName: arrayImagens[i])
                            .resizable()
                            .frame(width: 40,height: 40)
                        }
                    }
                }.font(.system(size: 45))
                .foregroundColor(.white)
                    
            }
        }
    }
}

#Preview {
    musicaView(musica : musics[0])
}
