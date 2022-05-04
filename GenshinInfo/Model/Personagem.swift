//
//  Personagem.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 21/04/22.
//

import Foundation

protocol PersonagemDelegate{
    func detalhe(_ personagem: Personagem)
}

struct Personagem: Codable{
//MARK: Atributos
    let id: Int
    let nome: String
    let visao: String
    let nacao: String
    let sobre: String
    let constelacao: String
    let asset: String
    let arma: String
    let armaAsset: String
    let tier: String
    
    static func jsonToData(_ json: [Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options:  [])
    }
    
    static func decodeJson(with data: Data) -> [Personagem]? {
        do{
            let p = try JSONDecoder().decode([Personagem].self, from: data)
            return p
            
        }catch{
            print(error)
            return nil
        }
    }
}
