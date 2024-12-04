//
//  Bird4.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

private extension Color {
    static let birdShade1: Color = .init(red: 58 / 256, green: 192 / 256, blue: 174 / 256)
    static let birdShade2: Color = .init(red: 149 / 256, green: 221 / 256, blue: 216 / 256)
    static let birdShade3: Color = .init(red: 255 / 256, green: 178 / 256, blue: 62 / 256)
    static let birdShade4: Color = .init(red: 221 / 256, green: 63 / 256, blue: 64 / 256)
}

struct Bird4: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            head
            legs
            birdBody
            wings
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(0.5))
                isLoaded = true
            }
        }
    }

    private var birdBody: some View {
        Capsule()
            .frame(width: 120, height: 80)
            .foregroundStyle(Color.birdShade1)
    }

    private var head: some View {
        ZStack {
            beak
            crest
            neck
            eye
        }
        .rotationEffect(isLoaded ? .degrees(-10) : .zero)
        .animation(
            .easeOut(duration: 2).repeatForever(),
            value: isLoaded
        )
    }

    private var wings: some View {
        UnevenRoundedRectangle(
            topLeadingRadius: 5,
            bottomLeadingRadius: 40,
            bottomTrailingRadius: 20,
            topTrailingRadius: 20,
            style: .circular
        )
        .frame(width: 65, height: 40)
        .rotationEffect(.degrees(-30))
        .offset(y: 10)
        .foregroundStyle(Color.birdShade2)
        .rotationEffect(isLoaded ? .degrees(10) : .zero, anchor: .topTrailing)
        .animation(
            .easeOut(duration: 2).repeatForever(),
            value: isLoaded
        )
    }

    private var neck: some View {
        Capsule()
            .frame(width: 140, height: 50)
            .rotationEffect(.degrees(-45))
            .offset(x: 20, y: -20)
            .foregroundStyle(Color.birdShade1)
    }

    private var eye: some View {
        Circle()
            .frame(width: 25)
            .foregroundStyle(.white)
            .offset(x: 50, y: -50)
    }

    private var beak: some View {
        Capsule()
            .frame(width: 30, height: 20)
            .offset(x: 80, y: -50)
            .foregroundStyle(Color.birdShade3)
    }

    private var crest: some View {
        ZStack {
            Capsule()
                .frame(width: 30, height: 50)
                .rotationEffect(.degrees(-45))
                .offset(x: 30, y: -80)
            Capsule()
                .frame(width: 30, height: 40)
                .rotationEffect(.degrees(-45))
                .offset(x: 25, y: -60)
        }
        .foregroundStyle(Color.birdShade4)
    }

    private var legs: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 10) {
                Capsule()
                    .frame(width: 10, height: 35)
                    .rotationEffect(.degrees(-30))
                Capsule()
                    .frame(width: 10, height: 35)
                    .rotationEffect(.degrees(-30))
            }
            .offset(y: 10)
            Capsule()
                .frame(width: 60, height: 10)
                .offset(x: 5)
        }
        .offset(y: 40)
        .foregroundStyle(Color.birdShade3)
    }
}

#Preview {
    Bird4()
}
