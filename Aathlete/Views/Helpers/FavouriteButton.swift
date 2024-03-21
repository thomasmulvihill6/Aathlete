//
//  FavouriteButton.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-04.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favourite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
