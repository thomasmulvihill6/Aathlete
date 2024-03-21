//
//  SettingsHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-27.
//

import SwiftUI

struct SettingsHome: View {
    @Environment(ModelData.self) private var modelData
    @Environment(WorkoutData.self) var workoutData
    var body: some View {
        ProfileHost()
            .environment(modelData)
            .environment(workoutData)
    }
}

#Preview {
    SettingsHome()
        .environment(ModelData())
        .environment(WorkoutData())
}
