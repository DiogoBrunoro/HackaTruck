//
//  modo2View.swift
//  Desafio 5
//
//  Created by Turma01-7 on 21/03/25.
//

import SwiftUI

struct modo2View: View {
    @State private var nome : String = ""
    @State private var modo2 : Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.azulMassa.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.pink)
                            .cornerRadius(10)
                        VStack{
                            Text("Digite seu nome")
                                .foregroundStyle(.white)
                            
                            TextField ("digite seu nome", text: $nome)
                                .multilineTextAlignment(.center)
                                .background(.white)
                                .frame(width: 150,height: 30)
                                .cornerRadius(20)
                            
                        }
                    }.padding()
                    NavigationLink(destination: modo21View(nome : nome)){
                        ZStack{
                            Rectangle()
                                .frame(width: 200, height: 50)
                                .foregroundColor(.pink)
                                .cornerRadius(10)
                            
                            Text("Ir para outra tela")
                                .foregroundStyle(.white)
                        }
                        
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    modo2View()
}
