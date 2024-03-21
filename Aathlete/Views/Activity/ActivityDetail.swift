//
//  ExerciseDetail.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-30.
//

import SwiftUI

struct ActivityDetail: View {
    @Environment(ModelData.self) private var modelData
    var activity: Activity

    var activityIndex: Int {
        modelData.activities.firstIndex(where: { $0.id == activity.id})!
    }

    var body: some View {
        @State var modelData = modelData
        ScrollView {
            BackgroundExerciseView(activity: activity)
            
            HStack{
                Text(activity.name)
                    .font(.title)
                FavouriteButton(isSet: $modelData.activities[activityIndex].isFavourite)
            }
            
            Divider()
            
            Text("**Force**: ") + Text(activity.force)
            Text("**Level**: ") + Text(activity.level)
            Text("**Mechanic**: ") + Text(activity.mechanic)
            Text("**Equipment**: ") + Text(activity.equipment)
            Text("**Primary Muscles**: ") + Text(activity.primaryMuscles.joined(separator: ", "))
            Text("**Secondary Muscles**: ") + Text(activity.secondaryMuscles.joined(separator: ", "))
            Text("**Category**: ") + Text(activity.category)
            Spacer()
            Text("**Instructions**: ")
            Text(activity.instructions.joined(separator: " ")).padding(.horizontal)
            
        }
        .navigationTitle(activity.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            modelData.showTopPicker = false
        }
        Spacer()
    }
    
}

#Preview {
    let modelData = ModelData()
    return ActivityDetail(activity: ModelData().activities[43])
        .environment(modelData)
}
