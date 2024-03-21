//
//  WorkoutEditorConfig.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-24.
//

import Foundation

struct WorkoutEditorConfig {
    var workout = workoutOld.emptyWorkout()
    var shouldSaveChanges = false
    var isPresented = false
    
    static let `default` = WorkoutEditorConfig()
    
    mutating func presentAddWorkout(/*sidebarItem: SidebarItem*/) {
        workout = workoutOld.emptyWorkout()
        shouldSaveChanges = false
        isPresented = true
    }
    
    mutating func presentEditWorkout(_ workoutToEdit: workoutOld) {
        workout = workoutToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
