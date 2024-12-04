//
//  PurplePlanet.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 19/11/24.
//

import SwiftUI

private extension Color {
    static let purple1: Color = .init(red: 220 / 256, green: 117 / 256, blue: 255 / 256)
    static let purple2: Color = .init(red: 183 / 256, green: 89 / 256, blue: 255 / 256)
    static let purple3: Color = .init(red: 149 / 256, green: 49 / 256, blue: 255 / 256)
    static let purple4: Color = .init(red: 126 / 256, green: 78 / 256, blue: 252 / 256)
}

struct PurplePlanet: View {
    @State private var isLoaded = false
    var body: some View {
        ZStack {
            planetView
            cloudLayer
        }
        .clipShape(Circle())
        .onAppear(perform: {
            isLoaded = true
        })
        .padding()
    }

    private var planetView: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.purple3)
                .frame(width: 300)
            Circle()
                .foregroundStyle(Color.purple2)
                .frame(width: 250)
                .offset(x: -30, y: -30)
            Circle()
                .foregroundStyle(Color.purple1)
                .frame(width: 150)
                .offset(x: -40, y: -40)
        }
    }

    private var cloudLayer: some View {
        VStack(spacing: 25) {
            Capsule()
                .frame(width: cloudSize.width, height: cloudSize.height)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation, value: isLoaded)
            Capsule()
                .frame(width: cloudSize.width, height: cloudSize.height)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(0.45), value: isLoaded)
            Capsule()
                .frame(width: cloudSize.width, height: cloudSize.height)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(-0.35), value: isLoaded)
        }
        .foregroundStyle(Color.purple4.opacity(0.7))
    }

    private var cloudAnimation: Animation {
        .linear(duration: 2)
            .repeatForever(autoreverses: false)
    }

    private var cloudOffsetX: CGFloat {
        isLoaded ? 200 : -200
    }

    private var cloudSize: CGSize {
        .init(width: 100, height: 60)
    }
}

#Preview {
    PurplePlanet()
}
