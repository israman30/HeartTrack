//
//  FirstPageView.swift
//  Heart Tracker
//
//  Created by Israel Manzo on 2/1/25.
//

import SwiftUI

struct PaginCount: Identifiable, Equatable {
    let id = UUID()
    var tag: Int
    
    static var previewPage = PaginCount(tag: 0)
    
    static var displayPages = [
        PaginCount(tag: 0),
        PaginCount(tag: 1),
        PaginCount(tag: 2)
    ]
}

struct Onboarding: Identifiable {
    var id: UUID = UUID()
    let title: String
    let description: String? = nil
    let tag: Int
    
    static var listItems: [Onboarding] = [
        Onboarding(title: "Welcome", tag: 0),
        Onboarding(title: "Seconde Page", tag: 1),
        Onboarding(title: "Third Page", tag: 2)
    ]
}

struct OnboardingPageView: View {
    
    @State private var selectedPage: Int = 0
    private let pages = PaginCount.displayPages
    
    @ViewBuilder
    var body: some View {
        TabView(selection: $selectedPage) {
            ForEach(pages) { page in
                OnboardingPage(page: Onboarding.listItems[page.tag])
                    .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: selectedPage)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    private func incrementPage() {
        selectedPage = (selectedPage + 1) % pages.count
    }
    
    private func decrementPage() {
        selectedPage = (selectedPage - 1 + pages.count) % pages.count
    }
}

#Preview {
    OnboardingPageView()
}


struct OnboardingPage: View {
    var page: Onboarding
    
    var body: some View {
        ZStack {
            VStack {
                Text(page.title)
                    .font(.largeTitle)
                Text(page.description ?? "")
                    .font(.caption)
            }
        }
    }
}
