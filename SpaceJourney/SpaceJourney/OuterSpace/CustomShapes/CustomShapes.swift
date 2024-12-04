//
//  CustomShapes.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 19/11/24.
//

import SwiftUI

struct Triangle: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

struct Bump: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.minX, y: rect.maxY))
            path.addQuadCurve(
                to: .init(x: rect.maxX, y: rect.maxY),
                control: .init(x: rect.midX, y: rect.minY)
            )
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}
