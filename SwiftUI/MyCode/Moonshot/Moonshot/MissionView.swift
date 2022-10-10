//
//  MissionView.swift
//  Moonshot
//
//  Created by Oscar Fridh on 2022-10-09.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    struct Divider: View {
        var body: some View {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Divider()
                        
                        Text(mission.description)
                        
                        Divider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    crewScrollView
                     
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    var crewScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        CrewMemberView(crewMember: crewMember)
                    }
                }
            }
        }
    }
    
    struct CrewMemberView: View {
        let crewMember: CrewMember
        
        var body: some View {
            HStack {
                Image(crewMember.astronaut.id)
                    .resizable()
                    .frame(width: 104, height: 72)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .strokeBorder(
                                crewMember.isCommander ? .yellow : .white,
                                lineWidth: crewMember.isCommander ? 2 : 1)
                    )
                
                VStack(alignment: .leading) {
                    Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(crewMember.role)
                        .foregroundColor(crewMember.isCommander ? .yellow.opacity(0.6) : .secondary)
                        .foregroundColor(.secondary)
                }
                .bold(crewMember.isCommander)
            }
            .padding(.horizontal)
        }
    }
}

extension MissionView {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
        
        var isCommander: Bool {
            role == "Commander"
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[1], astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    }
}
