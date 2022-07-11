//
//  QuestionsListView.swift
//  FlipNotes (iOS)
//
//  Created by Misael Landero on 20/06/22.
//

import SwiftUI

struct QuestionsListView: View {
    
    //Model View coreData
    @Environment(\.managedObjectContext) var moc
    
    //Questions data
    @FetchRequest(entity: Question.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Question.question, ascending: true)]) var questions: FetchedResults<Question>
    

    
    @State var showAddCategory = false
    
    var body: some View {
        List{
            ForEach(questions, id: \.id) { question in
                NavigationLink(destination: Text(question.wrappedQuestion) ){
                    Text(question.wrappedQuestion)
                        .foregroundColor(question.categories?.categoryColor)
                }
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
        .navigationTitle("Questions")
        .sheet(isPresented: $showAddCategory){
            #if os(iOS)
            NavigationView{
                QuestionsFormView(model: QuestionDumbModel(newQuestion:true))
            }
            #else
            VStack{
                QuestionsFormView(model: QuestionDumbModel(newQuestion:true))
                    .padding()
            }
            .frame(width: 300, height: 200)
            #endif
        }
    }
}

struct QuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsListView()
    }
}
