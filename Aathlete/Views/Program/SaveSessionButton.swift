//
//  DailyQuote.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct SaveSessionButton: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .fill(Color.accentColor)
                .opacity(0.8)
                .frame(width: 300, height: 75)
                .overlay(Text("Save Session")
                    .font(.title)
                    .padding([.leading, .trailing], 20)
                    .multilineTextAlignment(.center))
        }
    }
}

#Preview {
    SaveSessionButton()
}
