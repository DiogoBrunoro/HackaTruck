//
//  ContentView.swift
//  Desafio  6
//
//  Created by Turma01-7 on 24/03/25.
//

import SwiftUI

struct Song : Identifiable{
    var id : Int
    var name : String
    var artist : String
    var capa : String
}

struct Album : Identifiable{
    var id : Int
    var name : String
    var capa : String
}

var musics = [
    Song(id: 1, name: "Poison", artist: "Bell Biv DeVoe", capa: "https://cdn-images.dzcdn.net/images/cover/1b53cc7cfc05cf81079c0d1d5cc2d72c/500x500-000000-80-0-0.jpg"),
    Song(id: 2, name: "Billie Jean", artist: "Michael Jackson", capa: "https://akamai.sscdn.co/tb/letras-blog/wp-content/uploads/2020/06/f9949e4-Capa-do-album-thriller.jpeg"),
    Song(id: 3, name: "Smells Like Teen Spirit", artist: "Nirvana", capa: "https://static.wixstatic.com/media/4c654f_712b6e211a76478fb8e9da9f640fff19~mv2.jpg/v1/fill/w_448,h_447,al_c,lg_1,q_80,enc_avif,quality_auto/4c654f_712b6e211a76478fb8e9da9f640fff19~mv2.jpg"),
    Song(id: 4, name: "Like a Prayer", artist: "Madonna", capa: "https://www.audiograma.com.br/wp-content/uploads/2023/06/MADONNALAP_001.jpg"),
    Song(id: 5, name: "I Will Always Love You", artist: "Whitney Houston", capa: "https://cdn.mercidisco.com.br/image/cache/data/whitney%20houston%20i%20will-800x800.png"),
    Song(id: 6, name: "Sweet Child O' Mine", artist: "Guns N' Roses", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e5/Guns_N%27_Roses_-_Sweet_Child_o%27_Mine.jpeg"),
    Song(id: 7, name: "Shape of You", artist: "Ed Sheeran", capa: "https://i1.sndcdn.com/artworks-000205276174-rkz33n-t1080x1080.jpg")
]

let albuns: [Album] = [
    Album(id: 1, name: "Thriller", capa: "https://upload.wikimedia.org/wikipedia/en/5/55/Michael_Jackson_-_Thriller.png"),
    Album(id: 2, name: "Back in Black", capa: "https://upload.wikimedia.org/wikipedia/pt/b/b6/Back_in_Black.jpg"),
    Album(id: 3, name: "Dark Side of the Moon", capa: "https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png"),
    Album(id: 4, name: "Abbey Road", capa: "https://upload.wikimedia.org/wikipedia/en/4/42/Beatles_-_Abbey_Road.jpg"),
    Album(id: 5, name: "Nevermind", capa: "https://upload.wikimedia.org/wikipedia/en/b/b7/NirvanaNevermindalbumcover.jpg")
]

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient : Gradient(colors : [.blue, .black]),startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ScrollView{
                VStack{
                    Image(.truck)
                        .resizable()
                        .frame(width: 250,height: 250)
                        .padding(.top, 50)
                    Text("HackaFM")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .padding([.top,.leading],20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Image(.truck)
                            .resizable()
                            .frame(width: 30,height: 30)
                        Text("HackaSongs")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }.padding([.leading,.bottom],20)
                    
                    
                    VStack{
                        ForEach(musics, id: \.id){
                            item in
                            NavigationLink(destination : musicaView(musica: item)){
                                HStack{
                                    AsyncImage(url: URL(string : item.capa)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 45, height: 45)
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }
                                    VStack{
                                        Text(item.name)
                                            .foregroundStyle(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.headline)
                                        Text(item.artist)
                                            .foregroundStyle(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.subheadline)
                                    }
                                    HStack(spacing : 2){
                                        Circle()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.white)
                                    }.padding(.trailing,10)
                                }
                            }.toolbarBackground(.white)
                        }
                    }.padding(.leading,10)
                    
                    Text("Sugeridos")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(albuns) { albun in
                                VStack{
                                    AsyncImage(url: URL(string : albun.capa)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }
                                    Text(albun.name)
                                        .foregroundStyle(.white)
                                        .font(.subheadline)
                                        .padding(20)
                                }
                            }
                        }
                        }
                            
                    }
                    
                }
            }
        }.tint(.white)
        }
    }

#Preview {
    ContentView()
}
