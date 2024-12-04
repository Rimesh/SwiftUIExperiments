//
//  WhiteDwarfView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 18/11/24.
//

import SwiftUI

private extension Color {
    static let bodyWhite: Color = .init(red: 255 / 256, green: 250 / 256, blue: 231 / 256)
    static let ringBlue: Color = .init(red: 93 / 256, green: 217 / 256, blue: 215 / 256)
    static let ringBlue2: Color = .init(red: 88 / 256, green: 180 / 256, blue: 191 / 256)
    static let eyeBrown: Color = .init(red: 92 / 256, green: 36 / 256, blue: 2 / 256)
    static let facePink: Color = .init(red: 254 / 256, green: 192 / 256, blue: 185 / 256)
    static let glowBlue: Color = .init(red: 13 / 256, green: 25 / 256, blue: 110 / 256)
    static let mouthPink: Color = .init(red: 234 / 256, green: 115 / 256, blue: 121 / 256)
}

struct WhiteDwarfView: View {
    @State private var isLoaded = false

    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .foregroundStyle(Color.ringBlue2)
                Circle()
                    .foregroundStyle(Color.ringBlue)
                    .padding(8)
                Circle()
                    .foregroundStyle(Color.bodyWhite)
                    .padding(16)
                ZStack {
                    HStack {
                        blush
                            .offset(x: -10, y: 40)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        blush
                            .offset(x: -10, y: 40)
                    }
                    HStack {
                        Spacer()
                            .frame(maxWidth: .infinity)
                        eye
                        Spacer()
                            .frame(maxWidth: .infinity)
                        eye
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                    .offset(x: isLoaded ? -4 : 4)
                    .animation(facialAnimation, value: isLoaded)

                    eyebrowPair
                        .offset(x: isLoaded ? -4 : 4, y: isLoaded ? -50 : -42)
                        .animation(facialAnimation, value: isLoaded)

                    smile
                        .offset(x: isLoaded ? -4 : 4, y: 18)
                        .animation(facialAnimation, value: isLoaded)
                }
            }
            .frame(width: 300, height: 300)
        }
        .onAppear(perform: {
            Task {
                try await Task.sleep(for: .seconds(0.5))
                withAnimation {
                    isLoaded = true
                }
            }
        })
    }

    private var eye: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.eyeBrown)
            Circle()
                .foregroundStyle(.black)
                .padding(12)
            Circle()
                .foregroundStyle(Color.white)
                .padding(24)
                .offset(x: isLoaded ? 12 : 4, y: isLoaded ? -6 : 2)
        }
    }

    private var eyebrowPair: some View {
        HStack {
            Spacer()
                .frame(maxWidth: .infinity)
            Capsule()
                .foregroundStyle(Color.facePink).opacity(0.5)
                .rotationEffect(.degrees(-8))
                .frame(width: 38, height: 8)
                .offset(x: -4)
            Spacer()
                .frame(maxWidth: .infinity)
            Capsule()
                .foregroundStyle(Color.facePink).opacity(0.5)
                .rotationEffect(.degrees(3))
                .frame(width: 38, height: 8)
                .offset(x: 8)
            Spacer()
                .frame(maxWidth: .infinity)
        }
    }

    private var blush: some View {
        ZStack {
            RadialGradient(
                colors: [Color.pink.opacity(0.4), Color.clear],
                center: .center,
                startRadius: 1,
                endRadius: 40
            )
            Circle()
                .foregroundStyle(Color.white)
                .frame(width: 6)
                .offset(x: 12, y: -6)
        }
    }

    private var smile: some View {
        VStack {
            facialDots
            ZStack {
                ZStack {
                    Capsule()
                        .frame(height: 10)
                        .foregroundStyle(Color.mouthPink)
                    Capsule()
                        .frame(width: 15, height: 20)
                        .foregroundStyle(Color.bodyWhite)
                }

                Circle()
                    .frame(width: isLoaded ? 44 : 35, height: isLoaded ? 44 : 35)
                    .foregroundStyle(Color.mouthPink.opacity(0.7))
                    .mask {
                        VStack(spacing: .zero) {
                            Spacer()
                                .frame(maxHeight: .infinity)
                            Rectangle()
                        }
                    }
            }
            .frame(width: 30, height: 15)
        }
    }

    private var facialDots: some View {
        HStack(spacing: 4) {
            Circle()
                .frame(height: 4)
            VStack(spacing: 2) {
                Circle()
                    .frame(height: 4)
                    .offset(x: 2, y: -4)
                Circle()
                    .frame(height: 4)
                    .offset(y: -4)
            }
            Circle()
                .frame(height: 4)
            VStack(spacing: 2) {
                Circle()
                    .frame(height: 4)
                    .offset(x: 2, y: -4)
                Circle()
                    .frame(height: 4)
                    .offset(y: -4)
            }
            .offset(y: 2)
            Circle()
                .frame(height: 4)
        }
        .offset(y: -4)
        .foregroundStyle(Color.facePink)
    }

    private var facialAnimation: Animation {
        Animation.easeOut(duration: 2).repeatForever()
    }
}

#Preview {
    WhiteDwarfView()
}
