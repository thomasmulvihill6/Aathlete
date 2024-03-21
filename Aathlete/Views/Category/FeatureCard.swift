//
//  FeatureCard.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-23.
//

import SwiftUI

struct FeatureCard: View {
    @EnvironmentObject var modelData: ModelData
    var activity: Activity
    
    var body: some View {
        NavigationLink(destination: ActivityDetail(activity: activity).environmentObject(modelData)) {
            activity.featureImage?
                .resizable()
                .overlay {
                    TextOverlay(activity: activity)
                }
        }
        .buttonStyle(.plain)
    }
}

struct TextOverlay: View {
    var activity: Activity
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading){
                Text(activity.name)
                    .font(.title)
                    .bold()
                Text(activity.muscleCategory!.rawValue.capitalized)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard( activity: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit).environmentObject(ModelData())
}
