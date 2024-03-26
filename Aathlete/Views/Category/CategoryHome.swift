//
//  CategoryHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-01-23.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) private var modelData
    @State private var showingProfile = false
    
    var body: some View {
        VStack(spacing: 0){
            NavigationSplitView {
                List {
                    // "Featured Exercises" are show here. Can swipe through to see what exercises are featured.
                    PageView(pages: modelData.features.map { FeatureCard(activity: $0).environment(modelData) })
                        .listRowInsets(EdgeInsets())

                    
                    Text("Exercises by Category")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    // Displays as a list the different workout categories. Each row contains the exercises that workout that specific muscle / body part.
                    ForEach(modelData.muscleCategories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key.capitalized, items: modelData.muscleCategories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .onAppear{
                    modelData.showTopPickerActivity = true
                }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .sheet(isPresented: $showingProfile){
                    ProfileHost()
                        .environment(modelData)
                }
            } detail: {
                Text("Select an Exercise")
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
