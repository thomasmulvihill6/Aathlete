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
    @Binding var draftSession: Session

    var body: some View {
//        add draftSession to modelData
//        Make changes to draftSession (& ensure changes persist through modelData)
//        When leave, save draftSession
        
        @ObservedObject var modelData = modelData
        if let session = modelData.getSession(routine: routine),
           let sessionIndex = modelData.sessions.firstIndex(of: session){
            Text("Leg Day A")
            List{
                Section{
                    ForEach($modelData.sessions[sessionIndex].exercises.indices, id: \.self) { index in
                        let exerciseBinding = $modelData.sessions[sessionIndex].exercises[index]
                        NavigationLink(destination: EditExerciseForm(exercise: $modelData.sessions[sessionIndex].exercises[index])) {
                            HStack{
                                Text($modelData.sessions[sessionIndex].exercises[index].name.wrappedValue)
                                Spacer()
                                CompleteButton(isSet: $modelData.sessions[sessionIndex].exercises[index].isComplete)
                            
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
                            }
                        }
                    }
                }
            }
            Section{
                SaveSessionButton()
            }
            .listRowBackground(Color.clear)

        }
    }
}

#Preview {
    let routine = Routine(name: "Leg Day", activities: ModelData().legDayAActivities())
    let modelData = ModelData()
    var draftSession = Session(routine: routine)
    return ProgramSession(routine: .constant(routine), draftSession: .constant(draftSession))
        .environmentObject(modelData)
}
