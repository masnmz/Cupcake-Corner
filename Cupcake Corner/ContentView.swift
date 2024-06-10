//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Mehmet Alp Sönmez on 10/06/2024.
//

import CoreHaptics
import SwiftUI



struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        
    }
}

#Preview {
    ContentView()
}
