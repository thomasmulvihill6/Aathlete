//
//  WorkoutData.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-24.
//

import Foundation
import CodableFiles

let codableFiles = CodableFiles.shared

@Observable
class WorkoutData: ObservableObject{
    static let workoutsFilename = "workoutData.json"
    
    var allWorkouts: [workoutOld] = load(workoutsFilename)
    var config = WorkoutEditorConfig.default
    
    func delete(_ workout: workoutOld) {
        delete(workout.id)
    }
    
    func delete(_ id: workoutOld.ID) {
        if let index = index(for: id) {
            allWorkouts.remove(at: index)
        }
    }
    
    func update(_ workout: workoutOld) {
        if let index = index(for: workout.id) {
            allWorkouts[index] = workout
        }
    }
    
    func index(for id: workoutOld.ID) -> Int? {
        allWorkouts.firstIndex(where: { $0.id == id })
    }
    
    func workout(with id: Int) -> workoutOld? {
        return allWorkouts.first(where: { $0.id == id })
    }
    
}

extension WorkoutData{
    func add(_ workout: workoutOld) -> workoutOld.ID {
        var workoutToAdd = workout
        // Increment the workout id.
        workoutToAdd.id = (allWorkouts.map { $0.id }.max() ?? 0) + 1
        
        while allWorkouts.contains(where: { $0.id == workoutToAdd.id }) {
            workoutToAdd.id += 1
        }
        
        allWorkouts.append(workoutToAdd)
        return workoutToAdd.id
    }
    
    func updateJSON() {
        do {
            _ = try codableFiles.save(self.allWorkouts, withFilename: WorkoutData.workoutsFilename)
        } catch {
            print("CodableFiles - Error: \(error.localizedDescription)")
        }
    }
}
