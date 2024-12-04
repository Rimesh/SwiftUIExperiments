//
//  EarthView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 17/11/24.
//

import SwiftUI

private extension Color {
    static let earthBlue = Color(red: 33 / 256, green: 140 / 256, blue: 215 / 256)
    static let earthGreen = Color(red: 72 / 256, green: 203 / 256, blue: 95 / 256)
}

struct EarthView: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            oceanView
            landView
            cloudView
            nightView
        }
        .clipShape(Circle())
        .padding()
        .frame(width: 300, height: 300)
        .onAppear {
            withAnimation(.easeInOut(duration: 8)) {
                isLoaded = true
            }
        }
    }

    // MARK: Ocean View

    private var oceanView: some View {
        Circle()
            .fill(Color.earthBlue)
    }

    // MARK: Land Views

    private var landView: some View {
        VStack(spacing: 20) {
            ZStack {
                Capsule()
                    .frame(width: 45, height: 30)
                    .offset(x: landOffsetX)
                    .animation(landAnimation, value: isLoaded)
                continentView1
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(1), value: isLoaded)
            }
            ZStack {
                continentView2
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(-0.24), value: isLoaded)
                Capsule()
                    .frame(width: 129, height: 55)
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(0.7), value: isLoaded)
            }
            ZStack {
                Capsule()
                    .frame(width: 50, height: 25)
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(0.4), value: isLoaded)
                Capsule()
                    .frame(width: 70, height: 35)
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(0.8), value: isLoaded)
                Capsule()
                    .frame(width: 100, height: 35)
                    .offset(x: landOffsetX)
                    .animation(landAnimation.delay(-0.4), value: isLoaded)
            }
        }
        .foregroundStyle(Color.earthGreen)
    }

    private var continentView1: some View {
        VStack(spacing: .zero) {
            Capsule()
                .frame(height: 35)
            InvertedCapsule()
                .frame(width: 30, height: 10)
                .padding(.leading)
            HStack {
                Spacer()
                Capsule()
                Spacer()
            }
        }
        .foregroundStyle(Color.earthGreen)
        .frame(width: 100, height: 60)
    }

    private var continentView2: some View {
        VStack(spacing: .zero) {
            Capsule()
                .frame(width: 75, height: 35)
            InvertedCapsule()
                .frame(width: 30, height: 10)
                .padding(.leading)
            HStack {
                Spacer()
                Capsule()
                Spacer()
            }
        }
        .foregroundStyle(Color.earthGreen)
        .frame(width: 120, height: 80)
    }

    private var landAnimation: Animation {
        .linear(duration: 2).repeatForever(autoreverses: false)
    }

    private var landOffsetX: CGFloat {
        isLoaded ? 200 : -200
    }

    // MARK: Cloud Views

    private var cloudView: some View {
        VStack(spacing: 20) {
            smallClouds
            giantClouds
            tinyClouds
        }
        .foregroundStyle(Color.white)
    }

    private var smallClouds: some View {
        ZStack {
            VStack {
                Capsule()
                    .frame(width: 45, height: 15)
                    .offset(x: cloudOffsetX)
                    .animation(cloudAnimation.delay(1), value: isLoaded)
                Capsule()
                    .frame(width: 60, height: 15)
                    .offset(x: cloudOffsetX)
                    .animation(cloudAnimation.delay(1.5), value: isLoaded)
            }
            Capsule()
                .frame(width: 85, height: 25)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(0.35), value: isLoaded)
            Capsule()
                .frame(width: 60, height: 25)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(-0.25), value: isLoaded)
        }
    }

    private var giantClouds: some View {
        ZStack {
            bigCloud
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(0.7), value: isLoaded)
            Capsule()
                .frame(width: 60, height: 25)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(-0.55), value: isLoaded)
            VStack(spacing: .zero) {
                Capsule()
                    .frame(width: 90, height: 15)
                InvertedCapsule()
                    .frame(width: 45, height: 15)
                Capsule()
                    .frame(width: 60, height: 15)
            }
            .offset(x: cloudOffsetX)
            .animation(cloudAnimation.delay(0.1), value: isLoaded)
        }
        .foregroundStyle(Color.white)
    }

    private var bigCloud: some View {
        VStack(spacing: .zero) {
            Capsule()
                .frame(width: 65, height: 15)
                .padding(.leading, 45)
            InvertedCapsule()
                .frame(width: 30, height: 10)
                .padding(.leading)
            Capsule()
                .frame(width: 100, height: 20)
            InvertedCapsule()
                .frame(width: 30, height: 10)
                .padding(.trailing, 20)
            Capsule()
                .frame(width: 75, height: 30)
                .padding(.trailing, 25)
        }
    }

    private var tinyClouds: some View {
        ZStack {
            Capsule()
                .frame(width: 25, height: 15)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(0.1), value: isLoaded)
            Capsule()
                .frame(width: 86, height: 15)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(0.9), value: isLoaded)
            Capsule()
                .frame(width: 29, height: 15)
                .offset(x: cloudOffsetX)
                .animation(cloudAnimation.delay(1.3), value: isLoaded)
        }
    }

    private var cloudAnimation: Animation {
        .linear(duration: 2).repeatForever(autoreverses: false)
    }

    private var cloudOffsetX: CGFloat {
        isLoaded ? 250 : -250
    }

    // MARK: Night View

    private var nightView: some View {
        HStack {
            Spacer()
                .frame(maxWidth: .infinity)
            Rectangle()
                .foregroundStyle(Color.black.opacity(0.1))
        }
    }
}

#Preview(body: {
    EarthView()
})
