//
//  BajatApp.swift
//  Bajat
//
//  Created by Akash Gurava on 23/04/22.
//

import SwiftUI

@main
struct BajatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RustAppWrapper(rust: RustApp()))
        }
    }
}


class RustAppWrapper: ObservableObject {
    var rust: RustApp
    
    init (rust: RustApp) {
        self.rust = rust
    }
}

