//
//  CinzaView.swift
//  Desafio 4
//
//  Created by Turma01-7 on 21/03/25.
//

import SwiftUI

struct CinzaView: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea(.all, edges: .top)
            ZStack{
                Circle()
                    .frame(width: 280, height: 280)
                Image(systemName: "paintpalette")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 200, height: 200)
            } //  Zstack imagem
        } // Zstack background
    }
}

#Preview {
    CinzaView()
}
