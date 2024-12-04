//
//  Bird5.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

private extension Color {
    static let birdShade1: Color = .init(red: 255 / 256, green: 130 / 256, blue: 2 / 256)
}

struct Bird5: View {
    var body: some View {
        ZStack {
            legs
            birdBody
            head
        }
    }

    private var birdBody: some View {
        UnevenRoundedRectangle(
            cornerRadii: .init(
                topLeading: 4,
                bottomLeading: 100,
                bottomTrailing: 100,
                topTrailing: 4
            )
        )
        .frame(width: 200, height: 130)
        .foregroundStyle(.black)
    }

    private var head: some View {
        ZStack(alignment: .top) {
            beak
            neck
            eye
        }
        .offset(x: 60, y: -80)
    }

    private var neck: some View {
        Capsule()
            .frame(width: 80, height: 150)
            .foregroundStyle(.black)
    }

    private var eye: some View {
        ZStack {
            Circle()
                .frame(width: 35)
                .foregroundStyle(.white)
            Circle()
                .frame(width: 30)
                .offset(x: 4, y: 18)
                .foregroundStyle(.black)
        }
        .offset(x: 10, y: 20)
    }

    private var beak: some View {
        Capsule()
            .frame(width: 45, height: 25)
            .foregroundStyle(Color.birdShade1)
            .offset(x: 45, y: 30)
    }

    private var legs: some View {
        ZStack {
            Capsule()
                .frame(width: 80, height: 15)
                .offset(y: 20)
                .foregroundStyle(Color.birdShade1)
            HStack(spacing: 15) {
                Capsule()
                    .frame(width: 15, height: 35)
                Capsule()
                    .frame(width: 15, height: 35)
            }
            .foregroundStyle(.black)
        }
        .offset(y: 75)
    }
}

#Preview {
    Bird5()
}
