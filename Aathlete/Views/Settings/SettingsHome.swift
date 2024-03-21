//
//  SettingsHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-27.
//

import SwiftUI

struct SettingsHome: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(WorkoutData.self) var workoutData
    var body: some View {
        ProfileHost()
            .environmentObject(modelData)
            .environment(workoutData)
    }
}

#Preview {
    SettingsHome()
        .environmentObject(ModelData())
        .environment(WorkoutData())
}
