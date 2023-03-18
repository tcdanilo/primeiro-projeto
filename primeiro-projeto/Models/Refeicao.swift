//
//  Refeicao.swift
//  primeiro-projeto
//
//  Created by Danilo Costa tiago on 13/03/23.
//

import UIKit

class Refeicao: NSObject {
    var nome:String
    var felicidade:Int
    var itens:Array<Item> = []
    
    init (nome:String,felicidade:Int,itens: [Item] = [] ) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
        
        
    }
    
    func TotalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total+=item.calorias
        }
        return total
    }
}
