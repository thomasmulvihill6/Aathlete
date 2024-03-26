//
//  ExerciseHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-27.
//

import SwiftUI

struct ActivityHome: View {
    @Environment(ModelData.self) private var modelData
    @State var tabIndex = 0

    var body: some View {
        ZStack(alignment: .top){
            if tabIndex == 0 {
                CategoryHome()
                    .environment(modelData)
                    .padding(.top, 10)
            }
            else {
                ActivityList()
                    .environment(modelData)
                    .padding(.top, 10)
            }
            
            if modelData.showTopPickerActivity{
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
        .environment(ModelData())
}
