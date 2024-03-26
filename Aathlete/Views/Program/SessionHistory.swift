//
//  SessionHistory.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

struct SessionHistory: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationStack{
            Divider()
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 10){
                    ForEach(modelData.sessions.reversed()){session in
                        Text(session.name)
                    }
                }
            }
            .navigationTitle("Session History")
        }
    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return SessionHistory()
        .environment(modelData)
}
