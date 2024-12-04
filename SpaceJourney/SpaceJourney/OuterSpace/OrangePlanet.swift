//
//  OrangePlanet.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 19/11/24.
//

import SwiftUI

private extension Color {
    static let orange1: Color = .init(red: 230 / 256, green: 46 / 256, blue: 67 / 256)
    static let orange2: Color = .init(red: 255 / 256, green: 107 / 256, blue: 28 / 256)
    static let orange3: Color = .init(red: 255 / 256, green: 80 / 256, blue: 27 / 256)
    static let orange4: Color = .init(red: 255 / 256, green: 50 / 256, blue: 74 / 256)
    static let surfacePink: Color = .init(red: 173 / 256, green: 23 / 256, blue: 164 / 256)
}

struct OrangePlanet: View {
    @State private var isLoaded = false
    var body: some View {
        ZStack {
            planetView
        }
        .padding()
    }

    private var planetView: some View {
        ZStack {
            surface
            explosion
            stripes
        }
        .frame(height: 250)
        .clipShape(Circle())
        .animation(
            .easeOut(duration: 6),
            value: isLoaded
        )
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(0.5))
                isLoaded = true
            }
        }
    }

    private var surface: some View {
        Circle()
            .foregroundStyle(Color.surfacePink)
            .frame(width: 250)
    }

    private var stripes: some View {
        VStack(spacing: .zero) {
            Color.orange1
            Color.orange2
            Color.orange3
            Color.orange4
            Color.red
        }
        .opacity(0.5)
        .rotationEffect(.degrees(-30))
    }

    private var explosion: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.orange2)
                .frame(width: isLoaded ? 200 : 120)
                .offset(x: -30, y: -30)
            Circle()
                .foregroundStyle(Color.orange)
                .frame(width: isLoaded ? 120 : 80)
                .offset(x: -40, y: -40)
        }
    }
}

#Preview {
    OrangePlanet()
}
