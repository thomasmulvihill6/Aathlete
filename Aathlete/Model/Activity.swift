//
//  Workout.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import Foundation
import SwiftUI

struct Activity: Hashable, Codable, Identifiable {
    let id = UUID()
    let name: String
    let force: String
    let level: String
    let mechanic: String
    let equipment: String
    let primaryMuscles: [String]
    let secondaryMuscles: [String]
    let instructions: [String]
    let category: String
    var isFavourite: Bool = false
    var isFeatured: Bool = false
    var isComplete: Bool = false
    
    init(id: UUID = UUID(), name: String = "", force: String = "", level: String = "", mechanic: String = "", equipment: String = "", primaryMuscles: [String] = [], secondaryMuscles: [String] = [], instructions: [String] = [], category: String = "", isFavourite: Bool = false, isFeatured: Bool = false, isComplete: Bool = false){
        self.name = name
        self.force = force
        self.level = level
        self.mechanic = mechanic
        self.equipment = equipment
        self.primaryMuscles = primaryMuscles
        self.secondaryMuscles = secondaryMuscles
        self.instructions = instructions
        self.category = category
        self.isFavourite = isFavourite
        self.isFeatured = isFeatured
        self.isComplete = isComplete

    }
    
    private var imageName: String?
    var image: Image {
        if let imageName = imageName {
            return Image(imageName)
        } else {
            return assignDefaultImage(activity: self)
        }
    }
    
    var featureImage: Image?{
        isFeatured ? Image(imageName! + "_feature"): nil
    }
    
    var muscleCategory: Category? {Category(rawValue: primaryMuscles.first ?? "N/A")}
    enum Category: String, CaseIterable{
        case abdominals = "abdominals"
        case hamstrings = "hamstrings"
        case calves = "calves"
        case adductors = "adductors"
        case abductors = "abductors"
        case quadriceps = "quadriceps"
        case biceps = "biceps"
        case shoulders = "shoulders"
        case chest = "chest"
        case traps = "traps"
        case triceps = "triceps"
        case lats = "lats"
        case middleBack = "middle back"
        case lowerBack = "lower back"
        case forearms = "forearms"
        case glutes = "glutes"
        case neck = "neck"
        case blank = "N/A"
    }
    
    private enum CodingKeys: String, CodingKey{
        case name, force, level, mechanic, equipment, primaryMuscles, secondaryMuscles, instructions, category, imageName
    }
}
