//
//  ModelData.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import Foundation
import SwiftUI
import CodableFiles

@Obserable
class ModelData: ObservableObject{
    static let codableFiles = CodableFiles.shared

    var activities: [Activity] = load("activities.json")
    @Published var sessions: [Session] = []
    var exercises: [Exercise] = []
    var routines: [Routine] = []
    
    var profile = Profile.default
    var config = WorkoutEditorConfig.default
    var showTopPicker = true
    
    var features: [Activity] {
        assignFeaturedValue(value: true, activity: &activities[43])
        assignFeaturedValue(value: true, activity: &activities[63])
        return activities.filter {$0.isFeatured}
    }
    
    var muscleCategories: [String: [Activity]] {
        Dictionary(
            grouping: activities,
            by: { $0.muscleCategory?.rawValue ?? "N/A"}
        )
    }
}

extension ModelData {
    func legDayAActivities() -> [Activity] {
        let activityNames = ["Barbell Full Squat",
                             "Barbell Glute Bridge",
                             "Front Leg Raises",
                             "Leg Press"]
        var activities: [Activity] = []
        let modelData = ModelData()
        for name in activityNames{
            activities.append(modelData.getActivity(byName: name)!)
        }
        return activities
    }
}

extension ModelData {
    func newSession(routine: Routine)-> UUID?{
        let newSession = Session(routine: routine)
        sessions.append(newSession)
        return newSession.id
    }
    
    func getSession(routine: Routine)-> Session?{
        for session in sessions{
            if(session.routine == routine){
                return session
            }
        }
        return nil
    }
}

extension ModelData {
    func getActivity(byName name: String) -> Activity? {
        return activities.first { $0.name == name }
    }
    
    func getExercise(byName name: String) -> Exercise? {
        return exercises.first { $0.name == name }
    }
    
    func legDayA(names: [String]) -> [Activity] {
        var legDayActivities: [Activity] = []
        for name in names {
            legDayActivities.append(getActivity(byName: name)!)
        }
        return legDayActivities
    }
    
    func sessionIndex(uuid: UUID) -> Int? {
        return sessions.firstIndex { $0.id == uuid }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
