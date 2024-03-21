//
//  ProgramHome.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-05.
//

import SwiftUI

struct ProgramHome: View {
    @EnvironmentObject var modelData: ModelData
    @State var routine: Routine
    
    init() {
        _routine = State(initialValue: Routine(name: "Leg Day", activities: ModelData().legDayAActivities()))
    }
    
    var body: some View {        
        NavigationStack{
            Text("Today")
                .underline()
                .font(.title)
            NavigationLink{
                ProgramSession(routine: $routine)
                    .environmentObject(modelData)
            } label: {
                ProgramSessionSummary()
                    .foregroundStyle(Color.black)
            }
            .onTapGesture {
                modelData.sessions.append(Session(routine: routine))
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
        .environmentObject(ModelData())
}
