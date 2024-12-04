//
//  Bird1.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

private extension Color {
    static let birdShade1: Color = .init(red: 143 / 256, green: 215 / 256, blue: 225 / 256)
    static let birdShade2: Color = .init(red: 77 / 256, green: 190 / 256, blue: 208 / 256)
    static let birdShade3: Color = .init(red: 237 / 256, green: 139 / 256, blue: 93 / 256)
}

struct Bird1: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            legs
            ZStack(alignment: .top) {
                beak
                birdBody
                eyes
            }
        }
        .frame(width: 100, height: 100)
        .onAppear {
            withAnimation {
                isLoaded = true
            }
        }
    }

    private var birdBody: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 145,
                    bottomLeading: 145,
                    bottomTrailing: 50,
                    topTrailing: 10
                )
            )
            .frame(width: 100, height: 60)
            .offset(x: 25)
            .foregroundStyle(Color.birdShade2)
            Circle()
        }
        .foregroundStyle(Color.birdShade1)
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
        .offset(y: 50)
        .foregroundStyle(Color.birdShade3)
    }

    private var beak: some View {
        Capsule()
            .frame(width: 40, height: 18)
            .foregroundStyle(Color.birdShade3)
            .offset(x: -50, y: 40)
    }

    private var eyes: some View {
        Circle()
            .frame(width: 30)
            .foregroundStyle(.white)
            .offset(x: -18, y: 20)
    }
}

#Preview {
    Bird1()
}
