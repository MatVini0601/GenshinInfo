//
//  Nacao.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

struct Nacao: Codable{
    var inazuma: [Personagem]
    var liyue: [Personagem]
    var mondstadt : [Personagem]
    
    static func jsonToData(_ json: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    static func decodeJson(with data: Data) -> Nacao? {
        do{
            return try JSONDecoder().decode(Nacao.self, from: data)
        }catch{
            return nil
        }
    }
}
