//
//  BackgroundExerciseView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import SwiftUI

struct BackgroundExerciseView: View {
    var activity: Activity
    
    var body: some View {
        activity.image
            .resizable()
            .scaledToFill()
            .frame(width: 390, height: 200)
            .clipped()
            .overlay {
                Rectangle().stroke(.accent, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    return BackgroundExerciseView(activity: ModelData().activities[43])
}
