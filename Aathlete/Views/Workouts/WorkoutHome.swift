//
//  WorkoutHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-23.
//

import SwiftUI

struct WorkoutHome: View {
    @Environment(WorkoutData.self) var workoutData
    @Environment(ModelData.self) var modelData
    @State var tabIndex = 0
    
    var body: some View {
        ZStack(alignment: .top){
            if tabIndex == 0 {
                WorkoutHistory()
                    .environment(modelData)
                    .environment(workoutData)
                    .padding(.top, 10)
            } else {
                SessionHistory()
                    .environment(modelData)
                    .padding(.top, 10)
            }
            
            if modelData.showTopPickerWorkout{
                Picker("", selection: $tabIndex) {
                    Text("Old Workouts").tag(0)
                    Text("New Workouts").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return WorkoutHome()
        .environment(WorkoutData())
        .environment(modelData)
}
