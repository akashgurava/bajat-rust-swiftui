//
//  ContentView.swift
//  Bajat
//
//  Created by Akash Gurava on 23/04/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var rustApp: RustAppWrapper
    
    func getDocumentsDirectory() -> String {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0].absoluteString
    }

    var body: some View {
        _ = rustApp.rust.user_path(getDocumentsDirectory())
        return Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
