//
//  CardsView.swift
//  FlipNotes
//
//  Created by Misael Landero on 21/06/22.
//

import SwiftUI

struct CardsView: View {
    
    //Questions data
    @FetchRequest(entity: Question.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Question.question, ascending: true)]) var questions: FetchedResults<Question>
    
    
   @State var questionArray = [Question]()
  @State var isActive = true
    
    var body: some View {
        VStack{
            HStack{
                Button(action:shuffleCards){
                    Label("Shufle", systemImage: "shuffle")
                }
                Button(action:resetCards){
                    Label("Reset", systemImage: "arrow.clockwise")
                }
            }
            .accentColor(Color.accentColor)
            
            ZStack {
                ForEach(0..<questionArray.count, id: \.self) { index in
                    CardView(question: questionArray[index]) {
                        withAnimation {
                            removeCard(at: index)
                        }
                    }
                    .stacked(at: index, in: questionArray.count)
                    .allowsHitTesting(index == questionArray.count - 1)
                    .accessibilityHidden(index < questionArray.count - 1)
                }
            }
        }
        .onAppear{
            resetCards()
            shuffleCards()
        }
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }

        questionArray.remove(at: index)

        if questionArray.isEmpty {
            isActive = false
        }
    }
    
    func resetCards(){
        withAnimation(.easeInOut){
            questionArray = [Question]()
            for question in questions {
                questionArray.append(question)
            }
        }
        
    }
    
    func shuffleCards(){
        withAnimation(.easeInOut){
            questionArray.shuffle()
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
