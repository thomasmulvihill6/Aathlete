//
//  EditExerciseForm.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct EditExerciseForm: View {
    @Binding var exercise: Exercise
    
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
            .navigationBarItems(trailing: Button(action: {}, label: { Text("Save") }))
        } // End NavigationStack
    } // End Body
} // End View

#Preview {
    EditExerciseForm(exercise: .constant(.default))
}
