//
//  ContentView.swift
//  Shared
//
//  Created by Misael Landero on 14/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    // MARK: - Screen Size for determining ipad or iphone screen
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    // MARK: - current section selected
    @State var sectionSelected : SectionSelected? = .questions
    
    var body: some View {
        Group{
            #if os(iOS)
            if horizontalSizeClass == .compact {
                TabBarView()
            } else {
                SideBarView(sectionSelected : $sectionSelected)
            }
            #elseif os(macOS)
            //Text("hi test")
            SideBarView(sectionSelected : $sectionSelected)
            #endif
        }
    }
}
