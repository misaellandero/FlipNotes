//
//  CardsExtension.swift
//  FlipNotes
//
//  Created by Misael Landero on 21/06/22.
//

import SwiftUI
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}
