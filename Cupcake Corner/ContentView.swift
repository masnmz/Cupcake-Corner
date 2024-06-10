//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Mehmet Alp Sönmez on 10/06/2024.
//

import CoreHaptics
import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
    
}


struct ContentView: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    var body: some View {
        Button("Play Haptic:", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
    }
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an Error creating the Engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 10, by: 0.1){
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient
                                      , parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        
        for i in stride(from: 0, to: 10, by: 0.1){
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1-i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1-i))
            let event = CHHapticEvent(eventType: .hapticTransient
                                      , parameters: [intensity, sharpness], relativeTime: i + 1)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
        
        
    }
}

#Preview {
    ContentView()
}
