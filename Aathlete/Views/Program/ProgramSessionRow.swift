//
//  ProgramSessionRow.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

struct ProgramSessionRow: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        HStack{
            Text(exercise.name)
                .font(.title)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            CompleteButton(isSet: $exercise.isComplete)
        }
    }
}

#Preview {
    let exercise = Exercise.default
    return ProgramSessionRow(exercise: .constant(exercise))
}
