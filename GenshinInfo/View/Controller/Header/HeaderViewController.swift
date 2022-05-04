//
//  HeaderViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 21/04/22.
//

import UIKit

class HeaderViewController: UIView {    
    @IBOutlet weak var OrangeView: UIView!
    
    func configure(){
        OrangeView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500:300
        OrangeView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
