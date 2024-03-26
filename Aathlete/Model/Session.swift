//
//  Workout.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-22.
//

import Foundation

@Observable
class Session: Hashable, Identifiable, ObservableObject{
    var id = UUID()
    var routine: Routine
    var name: String
    var date: Date
    var exercises: [Exercise]

    init(id: UUID = UUID(), routine: Routine = Routine(), name: String = "Hello", date: Date = Date(), exercises: [Exercise] = []) {
        self.id = id
        self.routine = routine
        self.name = name
        self.date = date
        self.exercises = exercises
    }
    
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
        self.date = Date()
        let date = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let dateString = "\(date.year!)-\(String(format: "%02d", date.month!))-\(String(format: "%02d", date.day!))"
        self.name = "\(routine.name)_\(dateString)"
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
