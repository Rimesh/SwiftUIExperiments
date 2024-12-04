//
//  DestinationView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 03/12/24.
//

import SwiftUI

struct DestinationView<Content: View>: View {
    let content: Content

    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            SpaceView()
                .ignoresSafeArea()
            content
        }
    }
}
