//
//  ContentView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-16.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .program
    @EnvironmentObject var modelData: ModelData
    @Environment(WorkoutData.self) var workoutData
    
    // Declares an enum for the different tabs along the bottom of content view
    enum Tab {
        case program
        case featured
        case workouts
        case list
        case settings
    }
    
    var body: some View {
        // Create a tab along the bottom of the view where different pages/views can be added
        TabView(selection: $selection){
            ProgramHome()
                .environmentObject(modelData)
                .tabItem {
                    Label("My Program", systemImage: "figure.run")
                }
                .tag(Tab.program)
            ActivityHome()
                .environmentObject(modelData)
                .tabItem {
                    Label("Exercises", systemImage: "dumbbell.fill")
                }
                .tag(Tab.featured)
            WorkoutHome()
                .environment(workoutData)
                .tabItem {
                    Label("Your Workouts", systemImage: "figure.core.training")
                }
                .tag(Tab.workouts)
            SettingsHome()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
        .environment(WorkoutData())
}
