//
//  MainView.swift
//  Heart Tracker
//
//  Created by Israel Manzo on 2/3/25.
//

import SwiftUI
import Charts
import Observation

struct Rate: Identifiable {
    var id = UUID()
    var rate: Double
    var date: Date
}

@Observable
class ChartViewModel {
    var data: [Rate] = [
        .init(rate: 115, date: Date().addingTimeInterval(90)),
        .init(rate: 125, date: Date.now),
        .init(rate: 112, date: Date.distantFuture),
        .init(rate: 135, date: Date())
    ]
}

struct MainView: View {
    
    var data = ChartViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello, World!")
                Chart(data.data) { data in
                    LineMark(x: .value("Ratre", data.rate), y: .value("Date", data.date))
                }
            }
            .navigationTitle("Heart Tracker")
        }
    }
}

#Preview {
    MainView()
}
