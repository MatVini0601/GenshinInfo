//
//  DetalhePersonagemTableViewCell.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import UIKit

class DetalhePersonagemTableViewCell: UITableViewCell {

    @IBOutlet weak var sobreLabel: UILabel!
    @IBOutlet weak var constelacaoLabel: UILabel!
    @IBOutlet weak var nacaoLabel: UILabel!
    
    func configureCell(_ personagem: Personagem){
        sobreLabel.text = personagem.sobre
        constelacaoLabel.text = personagem.constelacao
        nacaoLabel.text = personagem.nacao
    }
    
//    func setCellLayout(view: UIView){
//        view.layer.cornerRadius = 16
//        view.layer.masksToBounds = false
//        view.clipsToBounds = false
//
//        view.layer.shadowRadius = 10
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = CGSize(width: -1, height: 1)
//        view.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
//
//        view.layer.shouldRasterize = true
//        view.layer.rasterizationScale = UIScreen.main.scale
//    }
}
