//
//  ScrumRecorderApp.swift
//  ScrumRecorder
//
//  Created by Chad Smith on 2/22/22.
//

import SwiftUI

@main
struct ScrumRecorderApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
