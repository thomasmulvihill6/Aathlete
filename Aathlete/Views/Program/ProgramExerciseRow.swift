////
////  SplitDayRow.swift
////  Aathlete
////
////  Created by Alexa Hadley on 2024-03-05.
////
//
//import SwiftUI
//
//struct ProgramExerciseRow: View {
//    @EnvironmentObject var modelData: ModelData
//    let exercise: Activity
//    var exerciseIndex: Int {
//        modelData.activities.firstIndex(where: { $0.id == exercise.id})!
//    }
//
//    var body: some View {
//        @Bindable var modelData = modelData
//        HStack{
//            Text(exercise.name)
//            Spacer()
//            CompleteButton(isSet: $modelData.activities[exerciseIndex].isComplete)
//        }
//    }
//}
//
//#Preview {
//    let exercises = ModelData().activities
//    let modelData = ModelData()
//    return Group{
//        ProgramExerciseRow(exercise: exercises[2])
//            .environmentObject(modelData)
//        ProgramExerciseRow(exercise: exercises[3])
//            .environmentObject(modelData)
//    }
//}
