import SwiftUI

struct ContentView: View {
    
    @State public var distancia: Double = 0
    @State public var tempo: Double = 0
    @State public var resp: Double = 0
    
   @State private var cor = Color.gray
    @State private var imagem = Image(.interrogacao)
    
    @State private var alert : Bool = false
    
    var body: some View {
        ZStack {
            cor.edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Digite a distância (km)")
                        .font(.title)
                        .cornerRadius(10)
                    
                    TextField("Digite a distância aqui", value: $distancia, format: .number)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(50)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                    
                    Text("Digite o tempo (h)")
                        .font(.title)
                        .cornerRadius(10)
                    
                    TextField("Digite o tempo aqui", value: $tempo, format: .number)
                        .keyboardType(.decimalPad)
                        .textContentType(.oneTimeCode)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(50)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                    
                    Button("Calcular") {
                        if distancia == 0 || tempo == 0{
                            resp = 0;
                            cor = trocarCor(resp : resp)
                            imagem = trocarImage(resp: resp)
                            alert = true;
                            
                            
                        }else{
                            resp = distancia / tempo;
                            cor = trocarCor(resp : resp)
                            imagem = trocarImage(resp: resp)
                        }
                    }
                    .padding(10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    
                    Spacer()
                    
                .alert(isPresented: $alert){
                Alert(title: Text("ERRO"), message: Text("Distancia nem tempo podem ser 0"),dismissButton: .default(Text("OK")))}
                    
                }.padding(.init(top: 0, leading: 0, bottom: 50, trailing: 0))// Vstack calculadora
                
                VStack {
                    Text("\(resp, specifier: "%.2f") KM/H")
                        .font(.title)
                    Spacer()
                } // Exibição do número
                
                VStack{
                    imagem
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 150, height: 150)
                        .shadow(radius: 50)
                    Spacer()
                }.padding(.init(top: 0, leading: 0, bottom: 50, trailing: 0))// fotos
                
                VStack{
                    ZStack{
                    Rectangle()
                        .frame(width: 300,height: 150)
                        .cornerRadius(20)
                        HStack{
                            VStack{
                                Text("TARTATURGA     (0 - 9.9km/h)")
                                Text("ELEFANTE       (10 - 29.9km/h")
                                Text("AVESTRUZ       (30 - 69.9km/h)")
                                Text("LEÃO           (70 - 89.9km/h")
                                Text("GUEPARDO       (90 - 100km/h")
                            }.foregroundColor(.white)
                            VStack{
                                Circle().fill(.verdeClaro).frame(width: 12, height: 12)
                                    .padding(2)
                                Circle().fill(.azulClaro).frame(width: 12, height: 12)
                                    .padding(2)
                                Circle().fill(.laranjaClaro).frame(width: 12, height: 12)
                                    .padding(2)
                                Circle().fill(.amareloClaro).frame(width: 12, height: 12)
                                    .padding(2)
                                Circle().fill(.vermelhoClaro).frame(width: 12, height: 12)
                                    .padding(2)
                            }
                        } }
                }// tabela
            }
        }
    }
}


func trocarCor(resp : Double) -> Color {
    if ( resp > 0 && resp <= 9.9 ){
       return Color(.verdeClaro);
    }
    if( resp >= 10 && resp <= 29.9){
        return Color(.azulClaro)
    }
    if( resp >= 30 && resp <= 69.9){
        return Color(.laranjaClaro)
    }
    if( resp >= 70 && resp <= 89.9){
        return Color(.amareloClaro)
    }
    if (resp >= 90 && resp <= 130){
        return Color(.vermelhoClaro)
    }
    return Color.gray
}

func trocarImage(resp : Double) -> Image{
    if ( resp > 0 && resp <= 9.9 ){
        return Image(.tartaruga);
    }
    if( resp >= 10 && resp <= 29.9){
        return Image(.elefante)
    }
    if( resp >= 30 && resp <= 69.9){
        return Image(.avestruz)
    }
    if( resp >= 70 && resp <= 89.9){
        return Image(.leao)
    }
    if (resp >= 90 && resp <= 130){
        return Image(.guepardo)
    }
    return Image(.interrogacao)
}

#Preview {
    ContentView()
}
