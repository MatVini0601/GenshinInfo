//
//  DecodableLiyue.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import Foundation

let sessaoNacao: [PersonagemViewModel]? = load("server-response.json")

func load(_ filename: String) -> [PersonagemViewModel]? {
    let data: Data
    
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
        
        guard let listaDePersonagem = json["personagens"] as? [String: Any] else {
            fatalError("error to read travel list")
        }
        
        guard let jsonData = Nacao.jsonToData(listaDePersonagem) else { return nil }
        
        let nacao = Nacao.decodeJson(with: jsonData)
        
        var listaPersonagemViewModel: [PersonagemViewModel] = []
        
        for sessao in listaDePersonagem.keys {
            switch enumNacao(rawValue: sessao)  {
            case .liyue:
                if let liyue = nacao?.liyue {
                    let liyueViewModel = NacaoLiyueViewModel(liyue)
                    listaPersonagemViewModel.append(liyueViewModel)
                }
                break
            case .mondstadt:
                if let mondstadt = nacao?.mondstadt{
                    let mondstadtViewModel = NacaoMondstadtViewModel(mondstadt)
                    listaPersonagemViewModel.append(mondstadtViewModel)
                }
            default:
                break
            }
        }
        return listaPersonagemViewModel
    } catch {
        fatalError("erro")
    }
}
