//
//  NacaoViewModel.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

class NacaoLiyueViewModel: PersonagemViewModel{
    var sessao: String{
        return "liyue"
    }
    var Nacao: enumNacao{
        return .liyue
    }
    var personagens: [Personagem]
    var numeroDeLinhas: Int{
        return personagens.count
    }
    
    init(_ personagem: [Personagem]){
        self.personagens = personagem
    }
}
