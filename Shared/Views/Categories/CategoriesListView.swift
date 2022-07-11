//
//  CategoriesListView.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

struct CategoriesListView: View {
    
    //Model View coreData
    @Environment(\.managedObjectContext) var moc
    
    //Categories data
    @FetchRequest(entity: Categories.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Categories.name, ascending: true)]) var categories: FetchedResults<Categories>
    
    @State var showAddCategory = false
    
    var body: some View {
        List{
            ForEach(categories, id: \.id) { category in
                NavigationLink(destination: Text(category.wrappedName) ){
                    Text(category.wrappedName)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .listRowBackground(category.categoryColor)
            }
        }
        .toolbar {
            ToolbarItem(placement:.primaryAction){
                Button(action:{
                    showAddCategory.toggle()
                }){
                    Label("Add", systemImage: "plus.circle.fill")
                        .foregroundColor(.accentColor)
                }
            }
        } 
        .navigationTitle("Categories")
        .sheet(isPresented: $showAddCategory){
            #if os(iOS)
            NavigationView{
                CategorieFormView(model: categoriesDumbModel(newCategory:true))
            }
            #else
            VStack{
                CategorieFormView(model: categoriesDumbModel(newCategory:true))
                    .padding()
            }
            .frame(width: 300, height: 200)
            #endif
        }
    } 
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView()
    }
}
