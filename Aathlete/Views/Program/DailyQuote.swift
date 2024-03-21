//
//  DailyQuote.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct DailyQuote: View {
    var body: some View {
        VStack{
            Text("Daily Quote!")
                .underline()
                .font(.title)
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .fill(Color.accentColor)
                .opacity(0.8)
                .frame(height: 100)
                .padding()
                .overlay(Text("Never back down never what? Never give up!")
                    .font(.title)
                    .padding([.leading, .trailing], 20)
                    .multilineTextAlignment(.center))
        }
    }
}

#Preview {
    DailyQuote()
}
