//
//  ContentView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("Time elapsed: \(timeElapsed) sec")
                .onReceive(timer) {firedDate in
                    print("timer fired")
                    timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                }
            Button("Pause") {
                timer.upstream.connect().cancel()
            }
            Button("Resume") {
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
        }
        .font(.largeTitle)
    }
}


#Preview {
    ContentView()
}
