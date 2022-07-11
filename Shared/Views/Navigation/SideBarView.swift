//
//  SideBarView.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

struct SideBarView: View {
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected?
    @State private var isDefaultItemActive = true
    
    var body: some View {
        NavigationView { 
            List() {
                NavigationLink(destination:
                                CategoriesListView(), tag: SectionSelected.categories, selection: $sectionSelected) {
                    Label("Categories", systemImage: "list.bullet.circle.fill")
                }
                
                NavigationLink(destination: QuestionsListView(), tag: SectionSelected.questions, selection: $sectionSelected) {
                    Label("Questions", systemImage: "questionmark.circle.fill")
                }
                
                NavigationLink(destination: Text("Tags"), tag: SectionSelected.tags, selection: $sectionSelected) {
                    Label("Tags", systemImage: "tag.circle.fill")
                }
                
                NavigationLink(destination: Text("Settings"), tag: SectionSelected.settings, selection: $sectionSelected) {
                    Label("Settings", systemImage: "gear")
                }
                NavigationLink(destination: CardsView(), tag: SectionSelected.cards, selection: $sectionSelected) {
                    Label("Cards", systemImage: "lanyardcard.fill")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250, idealWidth: 250, maxWidth: 350)
            .toolbar{
                #if os(iOS)
                ToolbarItem(placement:.principal){
                    Text("Flip Notes")
                }
                #elseif os(macOS)
                //Toggle Sidebar Button
                ToolbarItem(placement: .navigation){
                    
                    Text("\(Image(systemName: "sidebar.left"))")
                        .onTapGesture {
                            toggleSidebar()
                        }
                }
                #endif
            }
            
            
            #if  os(macOS)
            Text("Detail view")
            Text("Detail view")
            #endif
           
            //.navigationTitle("DebtMe")
        }
    }
    
    // Toggle Sidebar Function
    func toggleSidebar() {
        #if os(macOS)
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(sectionSelected: .constant(.questions))
    }
}
