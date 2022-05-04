//
//  NacaoMondstadtViewModel.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

class NacaoMondstadtViewModel: PersonagemViewModel{
    var sessao: String{
        return "mondstadt"
    }
    
    var Nacao: enumNacao{
        return .mondstadt
    }
    
    var personagens: [Personagem]
    
    var numeroDeLinhas: Int{
        return personagens.count
    }
    
    init(_ personagem: [Personagem]){
        self.personagens = personagem
    }    
}
