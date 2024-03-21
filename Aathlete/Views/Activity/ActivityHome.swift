//
//  ExerciseHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-27.
//

import SwiftUI

struct ActivityHome: View {
    @EnvironmentObject var modelData: ModelData
    @State var tabIndex = 0

    var body: some View {
        ZStack(alignment: .top){
            if tabIndex == 0 {
                CategoryHome()
                    .environmentObject(modelData)
                    .padding(.top, 10)
            }
            else {
                ActivityList()
                    .environmentObject(modelData)
                    .padding(.top, 10)
            }
            
            if modelData.showTopPicker{
                Picker("", selection: $tabIndex) {
                    Text("Featured Exercises").tag(0)
                    Text("All Exercises").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
    }
}

#Preview {
    ActivityHome()
        .environmentObject(ModelData())
}
