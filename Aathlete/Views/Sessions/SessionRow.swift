//
//  SessionHistory.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

struct SessionRow: View {
    @Environment(ModelData.self) var modelData
    var session: Session

    var body: some View {
        HStack{
            Text(session.name)
                .font(.title)
                .multilineTextAlignment(.leading)
            Spacer()
        }
//        ScrollView{
//            LazyVStack(alignment: .leading, spacing: 10){
//                ForEach(modelData.sessions.reversed()){session in
//                    Text(session.name)
//                }
//            }
//        }
//        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5))
    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return SessionRow(session: Session.default)
        .environment(modelData)
}
