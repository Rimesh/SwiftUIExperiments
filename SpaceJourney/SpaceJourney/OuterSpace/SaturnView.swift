//
//  SaturnView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 19/11/24.
//

import SwiftUI

private extension Color {
    static let ringBlue1: Color = .init(red: 28 / 256, green: 91 / 256, blue: 233 / 256)
    static let ringBlue2: Color = .init(red: 0 / 256, green: 218 / 256, blue: 255 / 256)
    static let ringBlue3: Color = .init(red: 93 / 256, green: 254 / 256, blue: 255 / 256)
    static let ringBlue4: Color = .init(red: 192 / 256, green: 255 / 256, blue: 253 / 256)
    static let ringBlue5: Color = .init(red: 39 / 256, green: 38 / 256, blue: 169 / 256)
}

struct SaturnView: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            topHalfRings
            planet
            bottomHalfRings
        }
        .rotationEffect(.degrees(-35))
        .onAppear {
            isLoaded = true
        }
    }

    private var planet: some View {
        ZStack {
            RadialGradient(
                colors: [.black, Color.ringBlue5],
                center: .center,
                startRadius: 2,
                endRadius: 60
            )
            .frame(width: 125, height: 125)
            .clipShape(Circle())

            Circle()
                .trim(from: 0.1, to: 0.45)
                .rotation(.degrees(isLoaded ? 0 : 360))
                .stroke(lineWidth: 5)
                .foregroundStyle(Color.ringBlue1.opacity(0.65))
                .frame(width: 100, height: 100)
                .animation(.ringAnimation, value: isLoaded)
        }
    }

    private var topHalfRings: some View {
        rings
            .maskTopHalf()
            .planetRotation()
    }

    private var bottomHalfRings: some View {
        rings
            .maskBottomHalf()
            .planetRotation()
    }

    private var rings: some View {
        ZStack {
            Circle()
                .ringEffect(isLoaded: isLoaded)
                .frame(width: 300)
                .foregroundStyle(Color.ringBlue1)
                .animation(.ringAnimation.delay(-0.75), value: isLoaded)
            Circle()
                .ringEffect(isLoaded: isLoaded)
                .frame(width: 260)
                .foregroundStyle(Color.ringBlue2)
                .animation(.ringAnimation.delay(0), value: isLoaded)
            Circle()
                .ringEffect(isLoaded: isLoaded)
                .frame(width: 220)
                .foregroundStyle(Color.ringBlue3)
                .animation(.ringAnimation.delay(0.75), value: isLoaded)
            Circle()
                .ringEffect(isLoaded: isLoaded)
                .frame(width: 180)
                .foregroundStyle(Color.ringBlue4)
                .animation(.ringAnimation.delay(-1.5), value: isLoaded)
        }
    }
}

private extension View {
    func maskTopHalf() -> some View {
        mask {
            VStack(spacing: .zero) {
                Rectangle()
                Spacer().frame(maxWidth: .infinity)
            }
        }
    }

    func maskBottomHalf() -> some View {
        mask {
            VStack(spacing: .zero) {
                Spacer().frame(maxWidth: .infinity)
                Rectangle()
            }
        }
    }

    func planetRotation() -> some View {
        rotation3DEffect(.degrees(80), axis: (x: 1, y: 0, z: 0))
    }
}

private extension Animation {
    static let ringAnimation: Self = .linear(duration: 3).repeatForever(autoreverses: false)
}

private extension Shape {
    func ringEffect(isLoaded: Bool) -> some View {
        return trim(from: 0.1, to: 1)
            .stroke(style: .init(lineWidth: 20, lineCap: .round))
            .rotationEffect(isLoaded ? .degrees(0) : .degrees(360))
            .padding(10)
    }
}

#Preview {
    SaturnView()
}
