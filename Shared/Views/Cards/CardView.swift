//
//  CardView.swift
//  FlipNotes
//
//  Created by Misael Landero on 21/06/22.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var question : Question
    var removal: (() -> Void)? = nil
    
    @State private var offset = CGSize.zero
    #if os(iOS)
    @State private var feedback = UINotificationFeedbackGenerator()
    #endif
    var body: some View {
        VStack{
            HStack{
                Text(question.categories?.wrappedName ?? "")
                    .font(.caption)
                Spacer()
            }
            Spacer()
            Text(question.wrappedQuestion)
            Spacer()
            Text(question.wrappedAnswer)
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(question.categories?.categoryColor ??  .black)
        .cornerRadius(10)
        .shadow(radius: 10)
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    #if os(iOS)
                    feedback.prepare()
                    #endif
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        #if os(iOS)
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                        } else {
                            feedback.notificationOccurred(.error)
                        }
                        #endif
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .animation(.spring(), value: offset)
    }
}

 
