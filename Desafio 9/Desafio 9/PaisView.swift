import SwiftUI

struct PaisView: View {
    var country : Paises
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                AsyncImage(url: URL(string : country.bandeira!)) { image in
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
                
                Text(country.nome!)
                    .padding(10)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 100)
                Text(country.historia!)
                    .padding(10)
                Text(country.continente!)
                    .padding(10)
                ForEach(0..<country.vizinhos.count, id: \.self) { e in
                    if let vizinho = country.vizinhos[e] {
                        Text(vizinho)
                    }
                }

                
                
            }
        }
    }
}
