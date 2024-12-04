//
//  ContentView.swift
//  SpaceJourney
//
//  Created by Rimesh Jotaniya on 03/12/24.
//

import SwiftUI

enum OuterSpace: String, CaseIterable, Identifiable {
    case starField = "Star Field"
    case whiteDwarf = "White Dwarf"
    case saturn = "Saturn"
    case orangePlanet = "Orange Planet"
    case purplePlanet = "Purple Planet"
    case earth = "Earth"

    var id: String {
        rawValue
    }
}

enum Bird: String, CaseIterable, Identifiable {
    case bird1 = "Blue Bird"
    case bird2 = "Flapping Bird"
    case bird3 = "Green Bird"
    case bird4 = "Breathing Bird"
    case bird5 = "Black Bird"

    var id: String {
        rawValue
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Planets and Stars") {
                    ForEach(OuterSpace.allCases) { object in
                        NavigationLink {
                            outerSpaceView(for: object)
                        } label: {
                            Text("\(object.rawValue)")
                        }
                    }
                }

                Section("Birds") {
                    ForEach(Bird.allCases) { bird in
                        NavigationLink {
                            birdView(for: bird)
                        } label: {
                            Text("\(bird.rawValue)")
                        }
                    }
                }

                Section("Space Journey") {
                    NavigationLink {
                        SpaceTravel()
                    } label: {
                        Text("Journey to Earth")
                    }
                }
            }
            .navigationTitle("Space Journey")
        }
    }

    @ViewBuilder
    private func outerSpaceView(for outerSpaceObject: OuterSpace) -> some View {
        switch outerSpaceObject {
        case .earth:
            DestinationView { EarthView() }
        case .purplePlanet:
            DestinationView { PurplePlanet() }
        case .orangePlanet:
            DestinationView { OrangePlanet() }
        case .saturn:
            DestinationView { SaturnView() }
        case .whiteDwarf:
            DestinationView { WhiteDwarfView() }
        case .starField:
            DestinationView { StarField() }
        }
    }

    @ViewBuilder
    private func birdView(for bird: Bird) -> some View {
        switch bird {
        case .bird1:
            DestinationView { Bird1() }
        case .bird2:
            DestinationView { Bird2() }
        case .bird3:
            DestinationView { Bird3() }
        case .bird4:
            DestinationView { Bird4() }
        case .bird5:
            DestinationView { Bird5() }
        }
    }
}

#Preview {
    ContentView()
}
