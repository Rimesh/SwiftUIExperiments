//
//  SpaceTravel.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 21/11/24.
//

import SwiftUI

struct SpaceTravel: View {
    @State private var showStarField = false
    @State private var showWhiteDwarf = false
    @State private var showSaturn = false
    @State private var showOrangePlanet = false
    @State private var showPurplePlanet = false
    @State private var showEarth = false
    var body: some View {
        ZStack {
            SpaceView()
            if showStarField {
                StarField()
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        )
                    )
                    .zIndex(1)
            }
            if showWhiteDwarf {
                WhiteDwarfView()
                    .scaleEffect(showWhiteDwarf ? 1 : 0.3)
                    .offset(
                        x: showWhiteDwarf ? 155 : 0,
                        y: showWhiteDwarf ? 250 : 0
                    )
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .scale(scale: 3)
                        )
                    )
                    .zIndex(2)
            }
            if showSaturn {
                SaturnView()
                    .scaleEffect(showSaturn ? 1 : 0.3)
                    .offset(
                        x: showSaturn ? -95 : 0,
                        y: showSaturn ? -200 : 0
                    )
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .scale(scale: 3)
                        )
                    )
                    .zIndex(2)
            }
            if showOrangePlanet {
                OrangePlanet()
                    .scaleEffect(showOrangePlanet ? 1 : 0.3)
                    .offset(
                        x: showOrangePlanet ? 150 : 0,
                        y: showOrangePlanet ? -210 : 0
                    )
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .scale(scale: 3.5)
                        )
                    )
                    .zIndex(2)
            }
            if showPurplePlanet {
                PurplePlanet()
                    .scaleEffect(showPurplePlanet ? 1 : 0.3)
                    .offset(
                        x: showPurplePlanet ? -160 : 0,
                        y: showPurplePlanet ? 250 : 0
                    )
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .scale(scale: 3)
                        )
                    )
                    .zIndex(2)
            }
            if showEarth {
                EarthView()
                    .scaleEffect(showEarth ? 1.2 : 0.3)
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .move(edge: .bottom).combined(with: .scale(scale: 3))
                        )
                    )
                    .zIndex(2)
            }
        }
        .onAppear { startJourney() }
    }

    private func startJourney() {
        withAnimation(.easeOut) {
            showStarField = true
        }
        withAnimation(animationCurve.delay(7)) {
            showWhiteDwarf = true
        } completion: {
            withAnimation(.easeOut) {
                showWhiteDwarf = false
            }
        }
        withAnimation(animationCurve.delay(13)) {
            showSaturn = true
        } completion: {
            withAnimation(.easeOut(duration: 0.6)) {
                showSaturn = false
            }
        }
        withAnimation(animationCurve.delay(19)) {
            showOrangePlanet = true
        } completion: {
            withAnimation(.easeOut(duration: 0.6)) {
                showOrangePlanet = false
            }
        }
        withAnimation(animationCurve.delay(25)) {
            showPurplePlanet = true
        } completion: {
            withAnimation(.easeOut(duration: 0.6)) {
                showPurplePlanet = false
            }
        }
        withAnimation(animationCurve.delay(32)) {
            showEarth = true
        } completion: {
            withAnimation(.easeOut(duration: 3.5)) {
                showStarField = false
                showEarth = false
            }
        }
    }

    var animationCurve: Animation {
        .timingCurve(0.3, 0.31, 1, 0.6, duration: 7)
    }
}

#Preview {
    SpaceTravel()
}
