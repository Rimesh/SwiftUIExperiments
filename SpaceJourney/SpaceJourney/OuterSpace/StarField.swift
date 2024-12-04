//
//  StarField.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 20/11/24.
//

import SwiftUI

struct StarField: View {
    @State private var start = false
    var body: some View {
        VStack {
            ZStack {
                ForEach(1 ..< 200) { index in
                    Circle()
                        .foregroundStyle(Color.white.opacity(0.8))
                        .frame(width: 6)
                        .offset(start ? randomLocation() : .zero)
                        .scaleEffect(start ? 1 : 0)
                        .animation(
                            .easeOut(duration: 16)
                                .delay(0.9 * Double(index) * 0.09)
                                .repeatForever(autoreverses: false),
                            value: start
                        )
                }
            }
            .onAppear {
                start = true
            }
        }
    }

    private func randomLocation() -> CGSize {
        let xPoint = randomX()
        let yPoint: CGFloat
        yPoint = xPoint < abs(300) ? randomLongY() : randomShortY()
        return .init(width: xPoint, height: yPoint)
    }

    private func randomX() -> CGFloat {
        var random: Int
        if Bool.random() {
            random = (300 ... 800).randomElement() ?? 300
        } else {
            random = (0 ... 299).randomElement() ?? 150
        }
        if Bool.random() {
            random *= -1
        }
        return CGFloat(random)
    }

    private func randomShortY() -> CGFloat {
        var random = (20 ... 500).randomElement() ?? 300
        if Bool.random() {
            random *= -1
        }
        return CGFloat(random)
    }

    private func randomLongY() -> CGFloat {
        var random = (400 ... 800).randomElement() ?? 300
        if Bool.random() {
            random *= -1
        }
        return CGFloat(random)
    }
}

#Preview {
    StarField()
}
