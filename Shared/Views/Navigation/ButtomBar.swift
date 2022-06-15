//
//  ButtonBar.swift
//  debtMe (iOS)
//
//  Created by Francisco Misael Landero Ychante on 27/03/21.
//

import SwiftUI
struct ButtomBar : View {
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                ButtonFromBar(sectionSelected: $sectionSelected, index: .categories, label: "Categories", image: "list.bullet")
                ButtonFromBar(sectionSelected: $sectionSelected, index: .questions, label: "Questions", image: "questionmark")
                ButtonFromBar(sectionSelected: $sectionSelected, index: .tags, label: "Tags", image: "tag.fill")
                ButtonFromBar(sectionSelected: $sectionSelected, index: .settings, label: "Settings", image: "gear")
            }
            .background(.regularMaterial)
            .cornerRadius(20)
            .padding()
        }.edgesIgnoringSafeArea(.all)
    }
}
 

struct ButtonFromBar: View {
    // MARK: - current section selected
    @Binding var sectionSelected : SectionSelected
    @State var index : SectionSelected
    @State var label : LocalizedStringKey
    @State var image : String
    var indexSelected : Bool {
         index == sectionSelected
    }
    
    var body: some View {
        Button(action:{
            self.sectionSelected = index
        }){
            VStack{
                Image(systemName: image)
                Text(label)
                    .font(.footnote)
                    .fixedSize(horizontal: true, vertical: false)
            }
            .padding(10)
            .opacity(indexSelected ? 1 : 0.5)
        }
        .accentColor(indexSelected ? .accentColor  : .gray)
    }
}
