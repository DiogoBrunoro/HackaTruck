//
//  ViewModel.swift
//  Desafio 9
//
//  Created by Turma01-7 on 27/03/25.
//

import Foundation
class ViewModel : ObservableObject {
    
    @Published var valor : [Umidades] = []
    
    func fatch(){
        
        guard let url = URL(string : "http://192.168.128.16:1880/umidadeGet") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Umidades].self, from: data)
                DispatchQueue.main.async{
                    self?.valor = parsed
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
}
