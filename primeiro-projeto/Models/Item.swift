//
//  Item.swift
//  primeiro-projeto
//
//  Created by Danilo Costa tiago on 13/03/23.
//

import UIKit

class Item: NSObject {
    var nome:String
    var calorias:Double
    
    init(nome:String,calorias:Double){
        self.nome=nome
        self.calorias=calorias
    }
}
