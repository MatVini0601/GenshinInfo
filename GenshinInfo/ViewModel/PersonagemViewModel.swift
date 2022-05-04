//
//  PersonagemViewModel.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

enum enumNacao: String{
    case inazuma
    case mondstadt
    case liyue
}

protocol PersonagemViewModel{
    var sessao: String { get }
    var Nacao: enumNacao { get }
    var personagens: [Personagem] { get set }
    var numeroDeLinhas: Int { get }
}
