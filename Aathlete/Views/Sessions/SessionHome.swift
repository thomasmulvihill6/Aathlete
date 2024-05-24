//
//  SessionHistory.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

struct SessionHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationStack{
            SessionList()
        }
    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return SessionHome()
        .environment(modelData)
}
