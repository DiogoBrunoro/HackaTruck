//
//  Model.swift
//  Desafio 9
//
//  Created by Turma01-7 on 27/03/25.
//

import Foundation

struct Paises : Decodable, Hashable{
    let nome : String?
    let bandeira: String?
    let historia : String?
    let continente : String?
    let vizinhos : [String?]
}

