//
//  AssignDefaultImage.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-23.
//

import Foundation
import SwiftUI

func assignDefaultImage(activity: Activity) -> Image {
    switch activity.muscleCategory{
    case .abdominals:
        return Image(systemName: "figure.core.training")
    case .hamstrings:
        return Image(systemName: "figure.pilates")
    case .calves:
        return Image(systemName: "figure.step.training")
    case .adductors:
        return Image(systemName: "figure.kickboxing")
    case .abductors:
        return Image(systemName: "figure.rolling")
    case .quadriceps:
        return Image(systemName: "figure.strengthtraining.functional")
    case .biceps:
        return Image(systemName: "dumbbell.fill")
    case .shoulders:
        return Image(systemName: "figure.bowling")
    case .chest:
        return Image(systemName: "dumbbell.fill")
    case .traps:
        return Image(systemName: "figure.cooldown")
    case .triceps:
        return Image(systemName: "figure.dance")
    case .lats:
        return Image(systemName: "figure.play")
    case .middleBack:
        return Image(systemName: "figure.rower")
    case .lowerBack:
        return Image(systemName: "figure.strengthtraining.traditional")
    case .forearms:
        return Image(systemName: "figure.martial.arts")
    case .glutes:
        return Image(systemName: "figure.stair.stepper")
    case .neck:
        return Image(systemName: "figure.taichi")
    default:
        return Image(systemName: "questionmark.square")
    }
}
