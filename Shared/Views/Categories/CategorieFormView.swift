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
    
    @State var model : categoriesDumbModel
    
    var save : () -> Void
    
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
                Button(action:save){
                    Label(model.newCategory ? "New": "Save", systemImage: model.newCategory ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                        .foregroundColor(.white)
                }.listRowBackground(Color.accentColor)
            }
            
        }
        .toolbar {
            ToolbarItem(placement:.primaryAction){
                Button(action:save){
                    Label(model.newCategory ? "New": "Save", systemImage: model.newCategory ? "plus.circle.fill" :  "square.and.arrow.down.fill")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle((model.newCategory ? "New": "Edit") + " Category")
        
    }
}

struct CategorieFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CategorieFormView( model: categoriesDumbModel(id: UUID(), name: "", details: "", color: 0), save: {})
        }
        
        NavigationView{
            CategorieFormView( model: categoriesDumbModel(newCategory: true), save: {})
        }
    }
}
