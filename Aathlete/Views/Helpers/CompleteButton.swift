//
//  CompleteButton.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct CompleteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Complete", systemImage: isSet ? "checkmark.square.fill" : "checkmark.square")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .green : .gray)
        }
        .buttonStyle(.borderless)
    }
}

#Preview {
    CompleteButton(isSet: .constant(true))
}
