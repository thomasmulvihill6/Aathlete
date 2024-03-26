//
//  WorkoutList.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import SwiftUI

struct ActivityList: View {
    @Environment(ModelData.self) private var modelData
    @State private var showFavouritesOnly = false
    
    var filteredActivities: [Activity] {
        
        modelData.activities.filter{ activity in
            (!showFavouritesOnly || activity.isFavourite)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                Toggle(isOn: $showFavouritesOnly){
                    Text("Favourites Only")
                }
                
                ForEach(filteredActivities) {activity in
                    NavigationLink {
                        ActivityDetail(activity: activity)
                    } label: {
                        ActivityRow( activity: activity)
                    }
                }
            }
            .animation(.default, value: filteredActivities)
            .navigationTitle("Exercises")
            .onAppear{
                modelData.showTopPickerActivity = true
            }
        } detail:{
            Text("Select an exercise")
        }
    }
}

#Preview {
    ActivityList()
        .environment(ModelData())
}
