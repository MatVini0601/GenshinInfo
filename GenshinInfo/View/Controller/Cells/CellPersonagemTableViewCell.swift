//
//  CellPersonagemTableViewCell.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 21/04/22.
//

import UIKit

class CellPersonagemTableViewCell: UITableViewCell {

    @IBOutlet weak var personagemImageView: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelTier: UILabel!
    @IBOutlet weak var simboloImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var armaImageView: UIImageView!
    
    func configurePersonagemCell(_ personagem: Personagem?){
        guard let personagem = personagem else { return }
        labelNome.text = personagem.nome
        labelTier.text = personagem.tier
        simboloImageView.image = UIImage(named: personagem.visao)
        armaImageView.image = UIImage(named: personagem.armaAsset)
        personagemImageView.image = UIImage(named: personagem.asset)
        
        setCellLayout()
        
    }
    
    func setCellLayout(){
        //Personagem
        personagemImageView.layer.cornerRadius = 12
        personagemImageView.layer.masksToBounds = true
        
        //CardView
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 20, height: 1)
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
        cardView.layer.shouldRasterize = true
        cardView.layer.rasterizationScale = UIScreen.main.scale
        cardView.layer.masksToBounds = false
    }
}
