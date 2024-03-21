//
//  WeeklySplitDayView.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct ProgramSession: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(ModelData.self) private var modelData
    @Binding var draftSession: Session
    @State private var draftExercise = Exercise()
    
    var body: some View {
        //        add draftSession to modelData
        //        Make changes to draftSession (& ensure changes persist through modelData)
        //        When leave, save draftSession
        @State var modelData = modelData
        
        HStack{
            Text("Leg Day A")
        }
        List{
            Section{
                ForEach($draftSession.exercises.indices, id: \.self) { index in
                    NavigationLink(destination: EditExerciseForm(exercise: $draftSession.exercises[index])) {
                        HStack{
                            Text($draftSession.exercises[index].name.wrappedValue)
                            Spacer()
                            CompleteButton(isSet: $draftSession.exercises[index].isComplete)
                        }
                    }
                }
            }
        }
        .toolbar{
            // Add a profile button in the top right corner (toolbar) , where a user can change their settings.
            Button {
                modelData.sessions.append(draftSession)
                self.presentationMode.wrappedValue.dismiss()
                // save to Session
                // return to programHome
            } label: {
                Label("Save", systemImage: "checkmark")
            }
        }
        
    }
}

#Preview {
    let routine = Routine(name: "Leg Day", activities: ModelData().legDayAActivities())
    let modelData = ModelData()
    var draftSession = Session(routine: routine)
    return ProgramSession(draftSession: .constant(draftSession))
        .environment(modelData)
}
