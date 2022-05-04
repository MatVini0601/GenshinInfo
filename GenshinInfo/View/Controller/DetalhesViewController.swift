//
//  DetalhesViewController.swift
//  GenshinInfo
//
//  Created by Matheus Vinicius Mota Rodrigues on 22/04/22.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var detalheTableView: UITableView!
    var personagem: Personagem?
    let detalhePersonagemNib: String = "DetalhePersonagemTableViewCell"
    let detalhePersonagemIdentifier: String = "DetalhePersonagemTableViewCell"
    let personagemHeaderNib: String = "DetalhePersonagemHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    init(_ personagem: Personagem){
        super.init(nibName: "DetalhesViewController", bundle: nil)
        self.personagem = personagem
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureTableView(){
        detalheTableView.dataSource = self
        detalheTableView.delegate = self
        detalheTableView.register(UINib(nibName: detalhePersonagemNib, bundle: nil), forCellReuseIdentifier: detalhePersonagemIdentifier)
    }
}

extension DetalhesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detalhePersonagemIdentifier) as? DetalhePersonagemTableViewCell else { fatalError("Erro ao fazer cast para o tipo DetalhePersonagemTableViewCell") }
        guard let personagem = personagem else { fatalError("Erro ao criar a celula") }
        cell.configureCell(personagem)
        
        return cell
    }
}

extension DetalhesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed(personagemHeaderNib, owner: self, options: nil)?.first as? DetalhePersonagemViewController
        guard let personagem = personagem else { fatalError("nao foi possivel fazer o parse no header de detalhe") }
        headerView?.configure(personagem)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
