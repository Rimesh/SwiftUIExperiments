//
//  Bird3.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

private extension Color {
    static let birdShade1: Color = .init(red: 121 / 256, green: 177 / 256, blue: 84 / 256)
    static let birdShade2: Color = .init(red: 59 / 256, green: 153 / 256, blue: 137 / 256)
    static let birdShade3: Color = .init(red: 237 / 256, green: 139 / 256, blue: 93 / 256)
}

struct Bird3: View {
    var body: some View {
        ZStack {
            legs
            birdBody
            ZStack {
                beak
                Circle()
                    .frame(width: 65)
                    .foregroundStyle(Color.birdShade2)
                Circle()
                    .frame(width: 25)
                    .foregroundStyle(.white)
            }
        }
    }

    private var birdBody: some View {
        VStack(spacing: .zero) {
            Bump()
                .frame(width: 170, height: 140)
                .foregroundStyle(Color.birdShade1)
            Capsule()
                .frame(width: 225, height: 40)
                .foregroundStyle(Color.birdShade2)
                .offset(x: -28)
        }
        .rotationEffect(.degrees(-155), anchor: .center)
        .offset(x: 25, y: 78)
    }

    private var beak: some View {
        Capsule()
            .frame(width: 30, height: 20)
            .foregroundStyle(Color.birdShade3)
            .offset(x: -40)
    }

    private var legs: some View {
        VStack(spacing: .zero) {
            HStack {
                Capsule()
                    .frame(width: 10, height: 30)
                Capsule()
                    .frame(width: 10, height: 30)
            }
            .offset(y: 10)
            Capsule()
                .frame(width: 60, height: 10)
        }
        .offset(x: 50, y: 100)
        .foregroundStyle(Color.birdShade3)
    }
}

#Preview {
    Bird3()
}
