/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 A view displaying information about a workout, including an elevation graph.
 */

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .scale.combined(with: .opacity))
    }
}

struct WorkoutView: View {
    var workout: workoutOld
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                if(!workout.observations.isEmpty){
                    WorkoutGraph(workout: workout, path: \.heartRate)
                        .frame(width: 50, height: 30)
                } else{
                    Image(systemName: "bolt")
                }
                
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .font(.headline)
                    Text(workout.timeAsString)
                }
                
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
            
            if showDetail {
                if(!workout.observations.isEmpty){
                    WorkoutDetail(workout: workout)
                        .transition(.moveAndFade)
                } else {
                    Image(systemName: "bolt")
                }
            }
        }
    }
}

#Preview {
    VStack {
        WorkoutView(workout: WorkoutData().allWorkouts[0])
            .padding()
        Spacer()
    }
}
