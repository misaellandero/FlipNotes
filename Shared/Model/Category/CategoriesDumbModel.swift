//
//  CategoriesDumbModel.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//

import Foundation
import SwiftUI

struct categoriesDumbModel {
    
    var id = UUID()
    var name = ""
    var details = ""
    var color  = 0
    var newCategory = false
    
    //For edition
    var categorie : Categories?
     
}
