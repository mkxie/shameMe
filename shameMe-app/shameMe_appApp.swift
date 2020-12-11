//
//  shameMe_appApp.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

@main
struct shameMe_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PainViewModel())
        }
    }
}
