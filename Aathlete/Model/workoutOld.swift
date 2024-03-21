//
//  Workout.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-22.
//

import Foundation

struct workoutOld: Codable, Hashable, Identifiable{
    var id: Int
    var name: String
    var totalTime: Int
    var difficulty: Int
    var observations: [Observation]
    
    struct Observation: Codable, Hashable {
        var caloricBurnRate: Range<Double>
        var heartRate: Range<Double>
        var timeFromStart: Int
    }
}

extension workoutOld{
    init(name: String, totalTime: Int, difficulty: Int){
        self.name = name
        self.totalTime = totalTime
        self.difficulty = difficulty
        self.observations = []
        self.id = workoutOld.newWorkoutId
    }
}

extension workoutOld{
    var timeAsString: String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .short
        let formattedString = formatter.string(from:TimeInterval(self.totalTime))!
        return formattedString
    }
    
    private static let newWorkoutId: workoutOld.ID = -1
    var isNew: Bool {
        id == workoutOld.newWorkoutId
    }
}

extension workoutOld{
    static func emptyWorkout() -> workoutOld {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        let json = """
            {
                "name": "",
                "id": \(workoutOld.newWorkoutId),
                "totalTime": 0,
                "difficulty": 1,
                "observations": []
            }
        """
        let data = Data(json.utf8)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(workoutOld.self, from: data)
        } catch {
            fatalError("Invalid workout JSON.")
        }
    }
}
