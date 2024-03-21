//
//  ProfileHost.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-13.
//

import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) private var modelData
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
        .environment(WorkoutData())
}
