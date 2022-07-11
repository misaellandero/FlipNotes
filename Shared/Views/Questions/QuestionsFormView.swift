//
//  QuestionsFormView.swift
//  FlipNotes
//
//  Created by Misael Landero on 20/06/22.
//

import SwiftUI

struct QuestionsFormView: View {
    
    //Model View CoreData
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var model : QuestionDumbModel
    
    //Categories data
    @FetchRequest(entity: Categories.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Categories.name, ascending: true)]) var categories: FetchedResults<Categories>
    
    var body: some View {
        List{
            TextField("Question", text: $model.question)
            TextField("Answer", text: $model.answer)
            
            Picker("Categorie", selection: $model.categorie){
                ForEach(0..<categories.count){ index in
                    Text(categories[index].wrappedName)
                        .tag(index)
                }
            }
           
            Section{
                HStack{
                    Button(action:Save){
                        Label(model.newQuestion ? "New": "Save", systemImage: model.newQuestion ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                            
                    }
                 
                    
                    #if os(macOS)
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Label("Cancel", systemImage: "xmark.circle")
                    }
                    .foregroundColor(.red)
                    #endif
                }
                #if os(iOS)
                .foregroundColor(.white)
                .listRowBackground(Color.accentColor)
                #endif
            }
             
        }
        .toolbar {
            ToolbarItem(placement:.primaryAction){
                Button(action:Save){
                    Label(model.newQuestion ? "New": "Save", systemImage: model.newQuestion ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle((model.newQuestion ? "New": "Edit") + " Category")
        
    }
     
    func Save(){
        if model.newQuestion {
            SaveNewCategorie()
        } else {
            SaveExistingCategorie()
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func SaveNewCategorie(){
        let newCategorie = Question(context: moc)
        newCategorie.id = model.id
        newCategorie.question = model.question
        newCategorie.answer = model.answer
        newCategorie.categories = categories[model.categorie]
        try? self.moc.save()
    }
    
    func SaveExistingCategorie(){
        if let categorie = model.questionCore {
            categorie.question = model.question
            categorie.answer = model.answer
            try? self.moc.save()
        }
    }
}

struct QuestionsFormView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsFormView( model: QuestionDumbModel())
    }
}
