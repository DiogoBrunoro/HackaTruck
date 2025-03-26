//
//  Model.swift
//  Desafio 8
//
//  Created by Turma01-7 on 26/03/25.
//

import Foundation

struct HaPO : Decodable, Hashable{
    let name : String?
    let alternate_names: [String]?
    let species : String?
    let gender : String?
    let house : String?
    let image : String?
}
