//
//  QuestionDumbModel.swift
//  FlipNotes
//
//  Created by Misael Landero on 20/06/22.
//

import SwiftUI

struct QuestionDumbModel {
    
    var id = UUID()
    var question = ""
    var answer = ""
    var moreInfo = ""
    var newQuestion = false
    var categorie = 0
    //For edition
    var questionCore : Question?
     
}

