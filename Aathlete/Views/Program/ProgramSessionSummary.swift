//
//  WeeklySplitDaySummary.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct ProgramSessionSummary: View {
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill(Color.accentColor)
            .opacity(0.8)
            .frame(height: 100)
            .padding()
            .overlay(Text("Leg Day A")
                .font(.title))
    }
}

#Preview {
    ProgramSessionSummary()
}
