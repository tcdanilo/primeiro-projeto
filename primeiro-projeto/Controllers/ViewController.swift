//
//  ViewController.swift
//  primeiro-projeto
//
//  Created by Danilo Costa tiago on 02/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nomeTextField : UITextField?
    
    @IBOutlet var felicidadeTextField : UITextField?
    
    @IBAction func adicionar(){
        if let nomeDaRefeicao = nomeTextField?.text , let FelicidadeDaRefeicao = felicidadeTextField?.text{
            let nome = nomeDaRefeicao
        if let felicidade = Int(FelicidadeDaRefeicao) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                print(" Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        } else {
            print("erro ao criar a refeicao!!!alo")
        }
            }
            
        
        
        
    }


}

