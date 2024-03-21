//
//  SplitExercise.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import Foundation

class Exercise: Hashable, Identifiable {
    var id = UUID()
    var session: Session
    var activity: Activity
    var name: String
    var sets: Int
    var repetitions: Int
    var weight: Int? = 0
    var time: Int? = 0
    var isComplete: Bool = false

    static let `default` = Exercise(session: Session.default, activity: ModelData().activities[0], name: "default", sets: 3, repetitions: 8)
    
    private enum CodingKeys: String, CodingKey{
        case name
    }
    
    init(session: Session, activity: Activity, name: String, sets: Int, repetitions: Int){
        self.session = session
        self.activity = activity
        self.name = name
        self.sets = sets
        self.repetitions = repetitions
    }
    
    init(session: Session, activity: Activity){
        self.session = session
        self.activity = activity
        self.name = activity.name
        self.sets = 0
        self.repetitions = 0
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
