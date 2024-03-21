//
//  RotatedBadgeSymbol.swift
//  Aathlete
//
//  Created by Alexa Hadley on 2024-02-13.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 90))
}
