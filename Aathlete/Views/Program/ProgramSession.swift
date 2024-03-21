//
//  WeeklySplitDayView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct ProgramSession: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var routine: Routine

    var body: some View {
        @ObservedObject var modelData = modelData
        if let session = modelData.getSession(routine: routine),
           let sessionIndex = modelData.sessions.firstIndex(of: session){
            Text("Leg Day A")
            List{
                Section{
                    ForEach( modelData.sessions[sessionIndex].exercises.indices, id: \.self) { index in
                        let exerciseBinding = $modelData.sessions[sessionIndex].exercises[index]
                        NavigationLink(destination: EditExerciseForm(exercise: exerciseBinding)) {
                            HStack{
                                Text(exerciseBinding.name.wrappedValue)
                                Spacer()
                                CompleteButton(isSet: exerciseBinding.isComplete)
                            }
    //                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
    //                            Button {
    //                                withAnimation{
    //                                    session.exercises[index].isComplete.toggle()
    //                                }
    //                            } label: {
    //                                Image(systemName: "checkmark.circle")
    //                                    .font(.system(size: 22))
    //                            }
    //                            .tint(.green)
    //                        }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let routine = Routine(name: "Leg Day", activities: ModelData().legDayAActivities())
    let modelData = ModelData()
    modelData.sessions.append(Session(routine: routine))
    return ProgramSession(routine: .constant(routine))
        .environmentObject(modelData)
}
