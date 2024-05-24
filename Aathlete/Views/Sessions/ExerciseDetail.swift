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

struct ExerciseDetail: View {
    @Environment(ModelData.self) var modelData
    @State private var showDetail = false
    var exercise: Exercise
    
    var body: some View {
        VStack{
            HStack{
                Text(exercise.name)
                    .font(.headline)
                
                Spacer()
                
                Button {
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
            
            if showDetail {
                HStack{
                    Text("Number of Sets")
                    Spacer()
                    Text("\(exercise.sets)")
                }
//                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                
                HStack{
                    Text("Number of Reps")
                    Spacer()
                    Text("\(exercise.repetitions)")
                }
//                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                
                HStack{
                    Text("Weight")
                    Spacer()
                    Text("\(exercise.weight!)")
                }
//                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))

                HStack{
                    Text("Time")
                    Spacer()
                    Text("\(exercise.time!)")
                }
//                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            }
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
    return ExerciseDetail(exercise: Exercise.default)
        .environment(modelData)
}
