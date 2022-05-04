//
//  DetalhePersonagemViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import UIKit

class DetalhePersonagemViewController: UIView {
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var personagemImageView: UIImageView!
    
    @IBOutlet weak var visaoImageView: UIImageView!
    @IBOutlet weak var armaImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tierLabel: UILabel!
    
    func configure(_ personagem: Personagem){
        nomeLabel.text = personagem.nome
        tierLabel.text = personagem.tier
        personagemImageView.image = UIImage(named: personagem.asset)
        visaoImageView.image = UIImage(named: personagem.visao)
        armaImageView.image = UIImage(named: personagem.armaAsset)
        configureLayout()
        
    }
    
    func configureLayout(){
        view.layer.cornerRadius = 16
        personagemImageView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
