//
//  MainView.swift
//  Heart Tracker
//
//  Created by Israel Manzo on 2/3/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello, World!")
            }
            .navigationTitle("Heart Tracker")
        }
    }
}

#Preview {
    MainView()
}
