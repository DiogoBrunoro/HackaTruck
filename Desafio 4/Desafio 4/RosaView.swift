//
//  RosaView.swift
//  Desafio 4
//
//  Created by Turma01-7 on 21/03/25.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Color.pinkest.ignoresSafeArea(.all, edges: .top)
            ZStack{
                Circle()
                    .frame(width: 280, height: 280)
                Image(systemName: "paintbrush")
                .resizable()
                .foregroundColor(.pinkest)
                .frame(width: 200, height: 200)
            } //  Zstack imagem
        } // Zstack background
    }
}

#Preview {
    RosaView()
}
