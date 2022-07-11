//
//  TabBarView.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI

import SwiftUI

struct TabBarView: View {
    // MARK: - current section selected
    @State var sectionSelected = SectionSelected.questions
    
    var body: some View {
        
        ZStack{
            switch sectionSelected {
            case .categories:
                NavigationView{
                    CategoriesListView()
                }
            case .questions:
                NavigationView{
                    Text("Questions")
                }
            case .tags:
                NavigationView{
                    Text("Tags")
                }
            case .settings:
                NavigationView{
                    Text("settings")
                }
            case .cards:
                NavigationView{
                    CardsView()
                }
            }
            
            ButtomBar(sectionSelected: $sectionSelected)
               
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView( )
            .preferredColorScheme(.dark)
    }
}
