//
//  ProgramHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct ProgramHome: View {
    @Environment(ModelData.self) private var modelData
    @State private var draftSession = Session()
    @State private var routine: Routine = {
        return Routine(name: "Leg Day", activities: ModelData().legDayAActivities())
    }()
    
    var body: some View {
        // When start new session, add session instance to sessions array
        // Pass in a blank session, when done and hit save session, add it to sessions array
        // 1. create new session = Session()
        // 2. Pass session into child view
        NavigationStack{
            Text("Today")
                .underline()
                .font(.title)
            NavigationLink{
                ProgramSession(draftSession: $draftSession)
                    .environment(modelData)
            } label: {
                ProgramSessionSummary()
                    .foregroundStyle(Color.black)
            }
            .onAppear() {
                draftSession = Session(routine: routine)
            }
            
            Text("Rest of the Week")
                .underline()
                .font(.title)
            
            NavigationLink{
                WeeklySplit()
            } label: {
                WeeklySplitSummary()
                    .foregroundStyle(Color.black)
            }
            
            DailyQuote()
        }
    }
}

#Preview {
    ProgramHome()
        .environment(ModelData())
}
