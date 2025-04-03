import SwiftUI

struct resultadoIMC: View {
    @Binding var imc: Double
    let genero: Genero
    
    var resultado: String {
        switch imc {
        case 0..<16: return "Magreza"
        case 16..<18.5: return "Abaixo do peso"
        case 18.5..<25: return "Peso ideal"
        case 25..<30: return "Sobrepeso"
        default: return "Obesidade"
        }
    }
    
    var imagem: String {
        let prefixo = genero == .masc ? "Masc" : "Fem"
        
        switch imc {
        case 0..<16: return "\(prefixo)1"
        case 16..<18.5: return "\(prefixo)2"
        case 18.5..<25: return "\(prefixo)3"
        case 25..<30: return "\(prefixo)4"
        default: return "\(prefixo)5"
        }
    }
    
    var body: some View {
        ZStack{
            Color.backgroundColor1.edgesIgnoringSafeArea(.all)
            VStack {
                Image(imagem)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                
                Text("O seu resultado de IMC é: **\(String(format: "%.2f", imc))**")
                    .font(.title2)
                    .foregroundStyle(.black)
                
                Text(resultado)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(.vermelhoRed)
                
                Spacer()
                
                Button {
                    imc = 0
                } label: {
                    Text("Recalcular IMC")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity)
                }
                .cornerRadius(30)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .tint(.vermelhoRed)
            }
            .padding()
        }
    }
}

#Preview {
    resultadoIMC(imc: .constant(10), genero: .masc)
}
