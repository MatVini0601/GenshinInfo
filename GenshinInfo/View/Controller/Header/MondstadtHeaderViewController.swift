//
//  MondstadtHeaderViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import UIKit

class MondstadtHeaderViewController: UIView {

    @IBOutlet weak var greenView: UIView!
    func configure(){
        greenView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500:300
        greenView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
