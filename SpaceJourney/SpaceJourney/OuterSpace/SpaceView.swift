//
//  SpaceView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 21/11/24.
//

import SwiftUI

private extension Color {
    static let dark1: Color = .init(red: 22 / 256, green: 21 / 256, blue: 30 / 256)
    static let dark2: Color = .init(red: 45 / 256, green: 45 / 256, blue: 63 / 256)
}

struct SpaceView: View {
    var body: some View {
        LinearGradient(
            colors: [.dark1, .dark2],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .ignoresSafeArea()
    }
}

#Preview {
    SpaceView()
}
