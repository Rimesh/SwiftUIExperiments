//
//  Bird2.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

private extension Color {
    static let birdShade1: Color = .init(red: 33 / 256, green: 208 / 256, blue: 166 / 256)
    static let birdShade2: Color = .init(red: 32 / 256, green: 176 / 256, blue: 148 / 256)
    static let birdShade3: Color = .init(red: 254 / 256, green: 211 / 256, blue: 52 / 256)
    static let birdShade4: Color = .init(red: 255 / 256, green: 130 / 256, blue: 2 / 256)
}

struct Bird2: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            head
            legs
            birdBody
            wings
        }
        .frame(width: 200, height: 200)
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(0.5))
                isLoaded = true
            }
        }
    }

    private var birdBody: some View {
        UnevenRoundedRectangle(
            cornerRadii: .init(
                topLeading: 0,
                bottomLeading: 145,
                bottomTrailing: 10,
                topTrailing: 100
            )
        )
        .frame(width: 200, height: 150)
        .foregroundStyle(Color.birdShade1)
    }

    private var head: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .frame(width: 50, height: 20)
                .offset(x: -30, y: -100)
                .foregroundStyle(Color.birdShade4)
            Capsule()
                .frame(width: 100, height: 120)
                .foregroundStyle(Color.birdShade3)
                .offset(y: -90)
            ZStack {
                Circle()
                    .frame(width: 30)
                Circle()
                    .frame(width: 25)
                    .foregroundStyle(Color.birdShade3)
                    .offset(y: 15)
            }
            .offset(x: 15, y: -110)
            .foregroundStyle(Color.white)
        }
        .offset(x: -50)
    }

    private var wings: some View {
        UnevenRoundedRectangle(
            cornerRadii: .init(
                topLeading: 0,
                bottomLeading: 145,
                bottomTrailing: 10,
                topTrailing: 100
            )
        )
        .frame(width: 100, height: 150)
        .foregroundStyle(Color.birdShade2)
        .offset(x: 50)
        .rotationEffect(.degrees(isLoaded ? -20 : 0), anchor: .top)
        .animation(.easeOut(duration: 1.5).repeatForever(), value: isLoaded)
    }

    private var legs: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 20) {
                Capsule()
                    .frame(width: 15, height: 35)
                Capsule()
                    .frame(width: 15, height: 35)
            }
            .offset(y: 10)
            Capsule()
                .frame(width: 90, height: 15)
        }
        .offset(y: 70)
        .foregroundStyle(Color.birdShade4)
    }
}

#Preview {
    Bird2()
}
