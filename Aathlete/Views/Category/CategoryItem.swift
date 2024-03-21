//
//  CategoryItem.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-06.
//

import SwiftUI

struct CategoryItem: View {
    var activity: Activity
    
    var body: some View {
        VStack(alignment: .center){
            activity.image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .foregroundStyle(Color.accentColor)
            Text(activity.name)
                .font(.caption)
                .foregroundStyle(.black)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 100)
                .padding(EdgeInsets())
                .lineLimit(3)
            
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(activity: ModelData().activities[0])
}
