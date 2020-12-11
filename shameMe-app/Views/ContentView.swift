//
//  ContentView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var instance: PainViewModel
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PainViewModel())
    }
}
