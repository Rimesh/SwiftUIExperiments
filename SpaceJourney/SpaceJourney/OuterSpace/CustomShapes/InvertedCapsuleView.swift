//
//  InvertedCapsuleView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 17/11/24.
//

import SwiftUI

struct InvertedCapsuleAutoAxis: Shape {
    func path(in rect: CGRect) -> Path {
        var rectanglePath = Path()
        rectanglePath.addRect(rect)
        if rect.width >= rect.height {
            return clipHorizontally(from: rectanglePath, rect: rect)
        } else {
            return clipVertically(from: rectanglePath, rect: rect)
        }
    }

    func clipHorizontally(from sourcePath: Path, rect: CGRect) -> Path {
        // right edge semi circle
        let rightEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.maxX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: .degrees(90),
                endAngle: .degrees(270),
                clockwise: false
            )
        }

        // left edge semi circle
        let leftEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.minX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: .degrees(90),
                endAngle: .degrees(270),
                clockwise: true
            )
        }

        return sourcePath
            .subtracting(rightEdgeCurve)
            .subtracting(leftEdgeCurve)
    }

    private func clipVertically(from sourcePath: Path, rect: CGRect) -> Path {
        // top edge semi circle
        let topEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.midX, y: rect.minY),
                radius: rect.width / 2,
                startAngle: .degrees(180),
                endAngle: .degrees(0),
                clockwise: true
            )
        }

        let bottomEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.midX, y: rect.maxY),
                radius: rect.width / 2,
                startAngle: .degrees(180),
                endAngle: .degrees(0),
                clockwise: false
            )
        }

        return sourcePath
            .subtracting(topEdgeCurve)
            .subtracting(bottomEdgeCurve)
    }
}

struct InvertedCapsule: Shape {
    func path(in rect: CGRect) -> Path {
        var rectanglePath = Path()
        rectanglePath.addRect(rect)
        // right edge semi circle
        let rightEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.maxX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: .degrees(90),
                endAngle: .degrees(270),
                clockwise: false
            )
        }

        // left edge semi circle
        let leftEdgeCurve = Path { path in
            path.addArc(
                center: .init(x: rect.minX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: .degrees(90),
                endAngle: .degrees(270),
                clockwise: true
            )
        }

        return rectanglePath
            .subtracting(rightEdgeCurve)
            .subtracting(leftEdgeCurve)
    }
}

#Preview {
    VStack {
        InvertedCapsule()
            .frame(width: 180, height: 180)
    }
}
