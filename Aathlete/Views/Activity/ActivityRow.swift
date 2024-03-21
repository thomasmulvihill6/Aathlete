//
//  WorkoutRow.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import SwiftUI

struct ActivityRow: View {
    var activity: Activity
    
    var body: some View {
        HStack{
            Text(activity.name)
                .font(.title)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            if  activity.isFavourite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        
    }
}

#Preview {
    let activities = ModelData().activities
    return Group{
        ActivityRow(activity: activities[0])
        ActivityRow(activity: activities[1])
    }
}
