//
//  MondstadtViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 21/04/22.
//

import UIKit

class MondstadtViewController: UIViewController {
    var personagens: [Personagem] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }
    
    //MARK: - ViewConfigurations
    func configuraTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CellPersonagemTableViewCell", bundle: nil), forCellReuseIdentifier: "CellPersonagemTableViewCell")
    }
}

//MARK: - TableViewDataSource Extension

extension MondstadtViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoMondstadt?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPersonagemTableViewCell") as? CellPersonagemTableViewCell else { fatalError("erro")}
        let click = UITapGestureRecognizer(target: self, action: #selector(detalhes(_:)))
        let viewModel = sessaoMondstadt?[indexPath.section]
        
        cell.addGestureRecognizer(click)
        cell.configurePersonagemCell(viewModel?.personagens[indexPath.row])
        return cell
    }
    
    @objc func detalhes(_ gesture: UITapGestureRecognizer){
        guard let celula = gesture.view as? UITableViewCell else { return }
        if let position = tableView.indexPath(for: celula){
            let personagem = sessaoMondstadt!.first!.personagens[position.row]
            present(DetalhesViewController(personagem), animated: true)
        }
    }
}

//MARK: - TableViewDelegate Extension
extension MondstadtViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("MondstadtHeader", owner: self, options: nil)?.first as? MondstadtHeaderViewController
        headerView?.configure()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 300:400
    }
}

