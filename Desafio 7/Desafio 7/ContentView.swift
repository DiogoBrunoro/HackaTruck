//
//  ContentView.swift
//  Desafio 7
//
//  Created by Turma01-7 on 25/03/25.
//

import SwiftUI
import MapKit

struct Location : Hashable{
    let nome : String
    let foto : String
    let descricao : String
    let latitude : Double
    let longitude : Double
}

let maravilhas = [
    Location(
        nome: "Cristo Redentor",
        foto: "https://rederiohoteis.com/wp-content/uploads/2017/09/2017-10-29-cristo-redentor-conheca-a-historia-dessa-maravilha-do-mundo-moderno2.jpg.webp",
        descricao: "A estátua monumental de Jesus Cristo, localizada no alto do Corcovado, no Rio de Janeiro, Brasil, é um ícone mundial de fé e um dos maiores símbolos do cristianismo. Com 30 metros de altura e 28 metros de largura, ela foi inaugurada em 1931 e oferece uma das vistas mais deslumbrantes da cidade.",
        latitude: -22.9519,
        longitude: -43.2105
    ),
    Location(
        nome: "Machu Picchu",
        foto: "https://caminoincamachupicchu.org/cmingutd/wp-content/uploads/2021/06/machu-picchu-llama.jpg",
        descricao: "Machu Picchu é uma antiga cidade inca situada nos Andes, no Peru, e um dos destinos turísticos mais procurados do mundo. Acredita-se que tenha sido construída no século XV e serve como um exemplo impressionante da engenharia e arquitetura incas, com suas paredes de pedras esculpidas com precisão e vistas espetaculares das montanhas ao redor.",
        latitude: -13.1631,
        longitude: -72.5450
    ),
    Location(
        nome: "Petra",
        foto: "https://wp.rotadeferias.com.br/wp-content/uploads/2017/07/IMG_6248.jpg.webp",
        descricao: "Petra, na Jordânia, é uma antiga cidade nabateia famosa pela sua arquitetura esculpida diretamente nas rochas vermelhas da região. Considerada uma das sete maravilhas do mundo moderno, Petra foi um centro comercial próspero e é famosa pela sua fachada monumental, o Tesouro, além de suas estruturas de túmulos e templos imponentes.",
        latitude: 30.3285,
        longitude: 35.4444
    ),
    Location(
        nome: "Coliseu",
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/500px-Colosseo_2020.jpg",
        descricao: "O Coliseu, localizado no centro de Roma, Itália, é um dos maiores anfiteatros do mundo antigo e um dos maiores símbolos da Roma Imperial. Com capacidade para até 80.000 espectadores, ele foi usado para combates de gladiadores e outros eventos públicos. Sua grandiosidade e engenharia avançada impressionam até hoje, sendo uma das atrações turísticas mais visitadas da Itália.",
        latitude: 41.9028,
        longitude: 12.4964
    ),
    Location(
        nome: "Grande Muralha da China",
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/The_Great_Wall_of_China_at_Jinshanling.jpg/600px-The_Great_Wall_of_China_at_Jinshanling.jpg",
        descricao: "A Grande Muralha da China é uma das maiores estruturas de defesa já construídas pela humanidade, estendendo-se por mais de 21.000 quilômetros. Sua construção começou no século VII a.C. e continuou por dinastias até o século XVII, servindo como proteção contra invasões. A muralha é uma das maiores realizações da engenharia militar e foi declarada Patrimônio Mundial da Humanidade pela UNESCO.",
        latitude: 40.4319,
        longitude: 116.5704
    ),
    Location(
        nome: "Chichén Itzá",
        foto: "https://viajeseumundo.com/wp-content/uploads/2019/07/como-chegar-cenote-ik-kil-chichen-itza-5-750x500.jpg",
        descricao: "Chichén Itzá é uma impressionante cidade maia pré-colombiana localizada no México, conhecida principalmente pela Pirâmide de Kukulcán, um exemplo de arquitetura sofisticada. Esta cidade foi um dos principais centros políticos, econômicos e religiosos da civilização maia, e seu legado inclui monumentos, templos e plataformas que se alinham perfeitamente com os movimentos astronômicos.",
        latitude: 20.6848,
        longitude: -88.5678
    ),
    Location(
        nome: "Taj Mahal",
        foto: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Taj_Mahal_N-UP-A28-a.jpg/640px-Taj_Mahal_N-UP-A28-a.jpg",
        descricao: "O Taj Mahal, localizado em Agra, Índia, é um dos monumentos mais emblemáticos do mundo e símbolo do amor eterno. Foi construído pelo imperador Shah Jahan em memória de sua esposa Mumtaz Mahal, que faleceu durante o parto de seu 14º filho. A estrutura é feita de mármore branco e está adornada com detalhes intrincados, jardins e uma grande cúpula central, sendo um Patrimônio Mundial da Humanidade.",
        latitude: 27.1751,
        longitude: 78.0421
    )
]

struct ContentView: View {
    
    @State private var position = MapCameraPosition.region( MKCoordinateRegion(
        center : CLLocationCoordinate2D(latitude: -14.2350, longitude: -41.9253),
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta:20))
    )
    
    @State private var selectedMaravilha : Int = 0
    @State private var mostraSheet = false
    @State private var maravilhaClicada : Location = maravilhas[0]
    var body: some View {
        ZStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.yellow)
                    .cornerRadius(50)
                    .frame(width: 250,height: 50)
                Picker(selection: $selectedMaravilha, label: Text("selecione a maravilha"))
                {
                    ForEach(0..<maravilhas.count, id: \.self) {
                        Text(maravilhas[$0].nome)
                    }
                }.foregroundColor(.black)
                    .onChange(of: selectedMaravilha){
                        
                        position = MapCameraPosition.region( MKCoordinateRegion (
                            center: CLLocationCoordinate2D(latitude: maravilhas[$0].latitude, longitude: maravilhas[$0].longitude),
                            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta:20))
                        )
                    }
                    
            }.offset(y:-350)
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            
            
            ZStack{
                Rectangle()
                    .foregroundColor(.yellow)
                    .cornerRadius(10)
                    .frame(width: 250,height: 50)
                Text("Maravilhas do mundo")
            }.offset(y:300)
            .zIndex(2.0)
            .shadow(radius: 40)
            
            
            
            Map(position: $position){
                ForEach(maravilhas, id: \.self){
                    lugar in
                    Annotation(lugar.nome, coordinate: CLLocationCoordinate2D(latitude: lugar.latitude, longitude: lugar.longitude)){
                        
                        Button {
                            maravilhaClicada = lugar
                            mostraSheet = true
                        } label: {
                            Image(systemName: "pin.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .clipShape(.circle)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            .sheet(isPresented: $mostraSheet){
                sheetView(lugar:$maravilhaClicada)
            }
        }
    }
}

struct sheetView: View{
    @Binding var lugar : Location
    var body: some View{
        ZStack(alignment: .top){
           Color.yellow.edgesIgnoringSafeArea(.all)
           VStack{
               AsyncImage(url: URL(string : lugar.foto)) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 150, height: 150)
                       .padding(.top,50)
                       .shadow(radius: 50)
               } placeholder: {
                   Image(systemName: "photo.fill")
               }
               
               Text(lugar.nome)
                   .font(.title)
                   .bold()
                   .padding(30)
               ZStack{
                   Rectangle()
                       .frame(width: 350,height: 350)
                       .foregroundColor(.brown)
                       .cornerRadius(10)
                   Text(lugar.descricao)
                       .frame(width: 300,height: 300)
                       .multilineTextAlignment(.center)
               }.padding(30)
               
           }
       }
    }
}


#Preview {
    ContentView()
}
