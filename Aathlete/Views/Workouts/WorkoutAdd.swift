//
//  WorkoutAdd.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-24.
//

import SwiftUI

struct WorkoutAdd: View {
    @Binding var config: WorkoutEditorConfig
    
    var body: some View {
        NavigationStack {
            WorkoutAddForm(config: $config)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(editorTitle)
                    }
                    
                    ToolbarItem(placement: cancelButtonPlacement) {
                        Button {
                            config.cancel()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    
                    ToolbarItem(placement: saveButtonPlacement) {
                        Button {
                            config.done()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        }
    }
    
    private var editorTitle: String {
        config.workout.isNew ? "Add Workout" : "Edit Workout"
    }
    
    private var cancelButtonPlacement: ToolbarItemPlacement {
        .navigationBarLeading
    }
    
    private var saveButtonPlacement: ToolbarItemPlacement {
        .navigationBarTrailing
    }
}
