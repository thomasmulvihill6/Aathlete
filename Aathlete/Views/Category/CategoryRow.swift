//
//  CategoryRow.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-06.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Activity]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { exercise in
                        NavigationLink{
                            ActivityDetail(activity: exercise)
                        } label : {
                            CategoryItem(activity: exercise)
                        }
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets())
        }
    }
}

#Preview {
    let exercises = ModelData().activities
    return CategoryRow(
        categoryName:exercises[0].muscleCategory!.rawValue,
        items: Array(exercises.prefix(5))
    )
}
