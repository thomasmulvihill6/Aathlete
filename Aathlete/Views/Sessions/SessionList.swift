//
//  SessionHistory.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

struct SessionList: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        List{
            ForEach(modelData.sessions.reversed()) {session in
                NavigationLink {
                    SessionDetail(session: session)
                } label: {
                    SessionRow(session: session)
                }
            }
        }
        //            .animation(.default, value: filteredActivities)
        .navigationTitle("Session History")
    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return SessionList()
        .environment(modelData)
}
