//
//  SessionHistory.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-03-26.
//

import SwiftUI

//extension AnyTransition {
//    static var moveAndFade: AnyTransition {
//        .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
//                    removal: .scale.combined(with: .opacity))
//    }
//}

struct SessionDetail: View {
    @Environment(ModelData.self) var modelData
    @State private var showDetail = false
    var session: Session
    
    var body: some View {
        VStack{
            Text(session.name)
                .font(.title)
                .bold()
            ForEach(session.exercises){exercise in
                ExerciseDetail(exercise: exercise)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding([.top, .bottom], 5)

            }
            Spacer()
        }
    }
    //        VStack {
    //            HStack {
    //
    //                Spacer()
    //
    //                Button {
    //                    withAnimation{
    //                        showDetail.toggle()
    //                    }
    //                } label: {
    //                    Label("Graph", systemImage: "chevron.right.circle")
    //                        .labelStyle(.iconOnly)
    //                        .imageScale(.large)
    //                        .rotationEffect(.degrees(showDetail ? 90 : 0))
    //                        .scaleEffect(showDetail ? 1.5 : 1)
    //                        .padding()
    //                }
    //            }
    //
    //            if showDetail {
    //                if(!workout.observations.isEmpty){
    //                    WorkoutDetail(workout: workout)
    //                        .transition(.moveAndFade)
    //                } else {
    //                    Image(systemName: "bolt")
    //                }
    //            }
    //        }
    //    }
}

#Preview {
    let modelData = ModelData()
    modelData.sessions.append(Session.default)
    return SessionDetail(session: Session.default)
        .environment(modelData)
}
