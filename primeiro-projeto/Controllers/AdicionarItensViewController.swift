//
//  AdicionarItensViewController.swift
//  primeiro-projeto
//
//  Created by Danilo Costa tiago on 17/03/23.
//

import UIKit
protocol AdicionaItensDelegate{
    func add (_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    //MARK: - Atributos
   
    var delegate : AdicionaItensDelegate?
    init (delegate : AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - View life cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField.text , let calorias = caloriasTextField.text else{
            return
        }
        if let numeroDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
       
    }
    
}
