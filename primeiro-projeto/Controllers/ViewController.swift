//
//  ViewController.swift
//  primeiro-projeto
//
//  Created by Danilo Costa tiago on 02/03/23.
//

import UIKit
protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao : Refeicao)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var itensTableView: UITableView!
    
    // MARK: - Atributos
    var delegate : AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 50.0),
                         Item(nome: "Queijo", calorias: 50.0),
                         Item(nome: "Molho de Apimentado", calorias: 50.0),
                         Item(nome: "Manjericão", calorias: 50.0)]
    var itensSelecionados: [Item] = []
   // MARK: IBOutlets
    @IBOutlet var nomeTextField : UITextField?
    @IBOutlet var felicidadeTextField : UITextField?
    
    
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain , target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
   @objc func adicionarItem(){
       let adicionarItensViewController = AdicionarItensViewController(delegate: self)
       navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula
    }
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at:position)
                
                
            }
        }
        
    }
    // MARK: IBActions
    @IBAction func adicionar() {
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade,itens: itensSelecionados)
        refeicao.itens = itensSelecionados
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

