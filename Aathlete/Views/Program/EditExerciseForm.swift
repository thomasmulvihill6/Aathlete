//
//  EditExerciseForm.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct EditExerciseForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var exercise: Exercise
    @State private var initName: String
    @State private var initSets: Int
    @State private var initReps: Int
    @State private var initWeight: Int
    @State private var initTime: Int

    init(exercise: Binding<Exercise>) {
        self._exercise = exercise
        // Initialize initial values when the view appears
        self._initName = State(initialValue: exercise.wrappedValue.name)
        self._initSets = State(initialValue: exercise.wrappedValue.sets)
        self._initReps = State(initialValue: exercise.wrappedValue.repetitions)
        self._initWeight = State(initialValue: exercise.wrappedValue.weight!)
        self._initTime = State(initialValue: exercise.wrappedValue.time!)
    }

    
    var body: some View {
        NavigationStack{
            Text("Record Exercise")
            Form{
                Section(header: Text(exercise.name)){
                    HStack{
                        Text("Number of Sets")
                        Spacer()
                        TextField("", value: $exercise.sets, format: .number)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Number of Repetitions")
                        Spacer()
                        TextField("", value: $exercise.repetitions, format: .number)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Weight")
                        Text("(optional)")
                            .foregroundStyle(.gray)
                        Spacer()
                        TextField("Weight", value: $exercise.weight, format: .number)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Time")
                        Text("(optional)")
                            .foregroundStyle(.gray)
                        Spacer()
                        TextField("Time", value: $exercise.time, format: .number)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                }
            } // End Form
            .navigationBarItems(trailing: Button(action: {
                exercise.saveExercise = true
                self.presentationMode.wrappedValue.dismiss()
            }, label: { Text("Save") }))
        } // End NavigationStack
        .onDisappear {
            // Restore initial values if not saved
            if !exercise.saveExercise {
                exercise.name = initName
                exercise.sets = initSets
                exercise.repetitions = initReps
                exercise.weight = initWeight
                exercise.time = initTime
            }
        }
    } // End Body
} // End View

#Preview {
    EditExerciseForm(exercise: .constant(.default))
}
