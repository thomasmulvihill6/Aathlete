/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 A view showing the details for a workout.
 */

import SwiftUI

struct WorkoutDetail: View {
    let workout: workoutOld
    @State var dataToShow = \workoutOld.Observation.heartRate
    
    var buttons = [
        ("Heart Rate", \workoutOld.Observation.heartRate),
        ("Caloric Burn Rate", \workoutOld.Observation.caloricBurnRate)
    ]
    
    var body: some View {
        VStack {
            WorkoutGraph(workout: workout, path: dataToShow)
                .frame(height: 200)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundStyle(value.1 == dataToShow
                                             ? .gray
                                             : .accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutDetail(workout: WorkoutData().allWorkouts[0])
}
