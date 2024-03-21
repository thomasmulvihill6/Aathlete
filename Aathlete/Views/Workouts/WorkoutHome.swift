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
    @State private var config = WorkoutEditorConfig()
    @State private var selection: workoutOld.ID?
    @State var tabIndex = 0
    
    var body: some View {
        ZStack(alignment: .top){
            if tabIndex == 0 {
                NavigationStack{
                    Divider()
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 10){
                            ForEach(workoutData.allWorkouts.reversed()){workout in
                                WorkoutView(workout: workout)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .padding([.top, .bottom], 5)
                            }
                        }
                    }
                    .navigationTitle("Workout History")
                    .toolbar{
                        // Add a profile button in the top right corner (toolbar) , where a user can change their settings.
                        Button {
                            config.presentAddWorkout()
                        } label: {
                            Label("Add New Workout", systemImage: "plus.circle")
                        }
                    }
                    .sheet(isPresented: $config.isPresented, onDismiss: didDismissEditor){
                        WorkoutAdd(config: $config)
                            .environment(workoutData)
                    }
                }
            } else {
                NavigationStack{
                    Divider()
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 10){
                            ForEach(modelData.sessions.reversed()){session in
                                Text(session.name)
                            }
                        }
                    }
                    .navigationTitle("Session History")
                    .toolbar{
                        // Add a profile button in the top right corner (toolbar) , where a user can change their settings.
                        Button {
                            config.presentAddWorkout()
                        } label: {
                            Label("Add New Workout", systemImage: "plus.circle")
                        }
                    }
                    .sheet(isPresented: $config.isPresented, onDismiss: didDismissEditor){
                        WorkoutAdd(config: $config)
                            .environment(workoutData)
                    }
                }
            }
            
            if modelData.showTopPicker{
                Picker("", selection: $tabIndex) {
                    Text("Old Workouts").tag(0)
                    Text("New Workouts").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
    }
    
    private var editorTitle: String {
        config.workout.isNew ? "Add Workout" : "Edit Workout"
    }
    
    private var cancelButtonPlacement: ToolbarItemPlacement {
        .navigationBarLeading
    }
    
    private var saveButtonPlacement: ToolbarItemPlacement {
        .navigationBarTrailing
    }
    
    private func didDismissEditor() {
        if config.shouldSaveChanges {
            if config.workout.isNew {
                selection = workoutData.add(config.workout)
            }
            else {
                workoutData.update(config.workout)
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
