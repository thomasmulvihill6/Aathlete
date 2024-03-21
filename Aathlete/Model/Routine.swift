//
//  Program.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import Foundation

struct Routine: Codable, Hashable, Identifiable{
    var id = UUID()
    var name: String
    var activities: [Activity]
    // maybe activitiesID: [UUID] and you call activities by UUID
    
    static let `default` = Routine(name: "default", activities: [])
//    static let `legDayARoutine` = Routine(name: "Leg Day A", activities: legDayAActivities())
    
    var numActivities: Int {
        activities.count
    }

    init(id: UUID = UUID(), name: String = "", activities: [Activity] = []) {
        self.id = id
        self.name = name
        self.activities = activities
    }
    
    init(name: String, activities: [Activity]) {
        self.name = name
        self.activities = activities
    }
}

//extension Routine {
//    static func legDayAActivities() -> [Activity] {
//        let activityNames = ["Barbell Full Squat",
//                             "Barbell Glute Bridge",
//                             "Front Leg Raises",
//                             "Leg Press"]
//        var activities: [Activity] = []
//        for name in activityNames{
//            activities.append(ModelData().getActivity(byName: name)!)
//        }
//        return activities
//    }
//}

//extension Routine {
//    static var legDayA: Routine {
//        return Routine(name: "Leg Day", activities: Routine.legDayAActivities())
//    }
//}
