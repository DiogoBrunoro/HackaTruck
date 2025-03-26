//
//  ViewModel.swift
//  Desafio 8
//
//  Created by Turma01-7 on 26/03/25.
//

import Foundation
class ViewModel : ObservableObject {
    
    @Published var personagem : [HaPO] = []
    
    func fatch(){
        
        guard let url = URL(string : "https://hp-api.onrender.com/api/characters/house/gryffindor") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([HaPO].self, from: data)
                DispatchQueue.main.async{
                    self?.personagem = parsed
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
}
