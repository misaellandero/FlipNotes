//
//  CategorieFormView.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

struct CategorieFormView: View {
    
    //Model View CoreData
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var model : categoriesDumbModel
    
    var body: some View {
        List{
            TextField("Name", text: $model.name)
            TextField("Details", text: $model.details)
            Picker(selection: $model.color, label: Label("Color", systemImage: "paintbrush.fill") , content: {
                ForEach(0..<AppColorsModel.colors.count){ index in
                    HStack{
                        Image(systemName: "paintbrush.pointed.fill")
                        Text(AppColorsModel.colors[index].name)
                        
                    }
                    .foregroundColor(AppColorsModel.colors[index].color)
                    .tag(index)
                }
            })
            .labelsHidden()
            
            Section{
                HStack{
                    Button(action:Save){
                        Label(model.newCategory ? "New": "Save", systemImage: model.newCategory ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                            
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
                    Label(model.newCategory ? "New": "Save", systemImage: model.newCategory ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle((model.newCategory ? "New": "Edit") + " Category")
        
    }
     
    func Save(){
        if model.newCategory {
            SaveNewCategorie()
        } else {
            SaveExistingCategorie()
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func SaveNewCategorie(){
        let newCategorie = Categories(context: moc)
        newCategorie.id = model.id
        newCategorie.name = model.name
        newCategorie.details = model.details
        newCategorie.color = Int16(model.color)
        try? self.moc.save()
    }
    
    func SaveExistingCategorie(){
        if let categorie = model.categorie {
            categorie.name = model.name
            categorie.details = model.details
            categorie.color = Int16(model.color)
            try? self.moc.save()
        }
    }
    
}

struct CategorieFormView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            CategorieFormView( model: categoriesDumbModel(id: UUID(), name: "", details: "", color: 0))
        }
        
        NavigationView{
            CategorieFormView( model: categoriesDumbModel(newCategory: true))
        }
    }
}
