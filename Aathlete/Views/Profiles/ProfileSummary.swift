//
//  ProfileSummary.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-13.
//

import SwiftUI


struct ProfileSummary: View {
    @Environment(WorkoutData.self) var workoutData
    var profile: Profile
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            WorkoutBadge(name: "First Workout")
                            WorkoutBadge(name: "First Leg Day")
                                .hueRotation(Angle(degrees: 90))
                            WorkoutBadge(name: "Tenth Workout")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                            
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Workouts")
                        .font(.headline)
                    
                    
                    WorkoutView(workout: workoutData.allWorkouts[0])
                }
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(WorkoutData())
}
