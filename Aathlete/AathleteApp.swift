//
//  AathleteApp.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-16.
//

//

import SwiftUI

@main
struct AathleteApp: App {
    @State private var modelData = ModelData()
    @State private var workoutData = WorkoutData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environment(workoutData)
        }
        .commands{
            CommandMenu("Task") {
                Button("Add New Task"){
                }
            }
            
            CommandGroup(after: .newItem){
                Button("Add New Group"){
                }
            } // End CommandGroup
        } // End .commands
    } // End body
} // End App
