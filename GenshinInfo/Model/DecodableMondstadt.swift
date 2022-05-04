//
//  DecodableMondstadt.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

let sessaoMondstadt: [PersonagemViewModel]? = loadMondstadt("server-response-mondstadt.json")

func loadMondstadt(_ filename: String) -> [PersonagemViewModel]?{
    let data: Data
    let recurso: String = "mondstadt"
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("error to read json dictionary")
        }
        
        guard let listaDePersonagem = json[recurso] as? [Any] else {
            fatalError("error to read mondstadt list")
        }
        
        
        guard let jsonData = Personagem.jsonToData(listaDePersonagem) else { return nil }
        guard let personagem = Personagem.decodeJson(with: jsonData) else { return nil }
        
        var listaPersonagemViewModel: [PersonagemViewModel] = []

        let mondstadtViewModel = NacaoMondstadtViewModel(personagem)
        listaPersonagemViewModel.insert(mondstadtViewModel, at: 0)

        return listaPersonagemViewModel
    } catch {
        fatalError("erro")
    }
}
