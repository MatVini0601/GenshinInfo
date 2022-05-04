//
//  ViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 14/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var personagens: [Personagem] = []
    let cellPersonagemNib: String = "CellPersonagemTableViewCell"
    let cellPersonagemIdentifier: String = "CellPersonagemTableViewCell"
    let LiyueHeaderNib: String = "LiyueHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }
    
    //MARK: - ViewConfigurations
    func configuraTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellPersonagemNib, bundle: nil), forCellReuseIdentifier: cellPersonagemIdentifier)
    }
}

//MARK: - TableViewDataSource Extension

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoLiyue?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellPersonagemIdentifier) as? CellPersonagemTableViewCell else { fatalError("erro")}
        guard let viewModel = sessaoLiyue?[indexPath.section] else { return UITableViewCell()}
        let click = UITapGestureRecognizer(target: self, action: #selector(detalhes(_:)))
        cell.addGestureRecognizer(click)
        cell.configurePersonagemCell(viewModel.personagens[indexPath.row])
        return cell
    }
    
    @objc func detalhes(_ gesture: UITapGestureRecognizer){
        guard let celula = gesture.view as? UITableViewCell else { return }
        if let position = tableView.indexPath(for: celula), let sessao = sessaoLiyue?.first{
            let personagem = sessao.personagens[position.row]
            present(DetalhesViewController(personagem), animated: true)
        }
    }
}

//MARK: - TableViewDelegate Extension
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed(LiyueHeaderNib, owner: self, options: nil)?.first as? HeaderViewController
        headerView?.configure()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}


