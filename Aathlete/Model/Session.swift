//
//  Workout.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-22.
//

import Foundation

class Session: Hashable, Identifiable, ObservableObject{
    var id = UUID()
    var routine: Routine
    var name: String
    var date: Date
    var exercises: [Exercise]
    
    init(routine: Routine, name: String, exercises: [Exercise]){
        self.routine = routine
        self.name = name
        self.date = Date()
        self.exercises = exercises
    }
    
    init(routine: Routine, name: String){
        self.routine = routine
        self.name = name
        self.date = Date()
        self.exercises = []
        for activity in routine.activities{
            self.exercises.append(Exercise(session: self, activity: activity))
        }
    }
    
    init(routine: Routine){
        self.routine = routine
        self.name = ""
        self.date = Date()
        self.exercises = []
        for activity in routine.activities{
            self.exercises.append(Exercise(session: self, activity: activity))
        }
    }
    
    static func == (lhs: Session, rhs: Session) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static let `default` = Session(routine: Routine.default, name:  "default")
}
