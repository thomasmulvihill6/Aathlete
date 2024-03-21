//
//  WorkoutAdd.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-24.
//

import SwiftUI

struct WorkoutAddForm: View {
    @Binding var config: WorkoutEditorConfig
    
    var body: some View {
        Form {
            TextField("Workout Name", text: $config.workout.name)
            Stepper("Difficulty: \(config.workout.difficulty)", value: $config.workout.difficulty, in: 1...5)
            TextField("Workout Duration", value: $config.workout.totalTime, formatter: NumberFormatter())
        }
    }
}

