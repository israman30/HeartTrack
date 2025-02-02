//
//  FirstPageView.swift
//  Heart Tracker
//
//  Created by Israel Manzo on 2/1/25.
//

import SwiftUI

struct Onboarding: Identifiable {
    var id: UUID = UUID()
    let title: String
    let description: String? = nil
    
    static var listItems: [Onboarding] = [
        Onboarding(title: "Welcome"),
        Onboarding(title: "Seconde Page"),
        Onboarding(title: "Third Page")
    ]
}

struct OnboardingPageView: View {
    
    var body: some View {
        TabView {
            ForEach(Onboarding.listItems) { page in
                OnboardingPage(page: page)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingPageView()
}


struct OnboardingPage: View {
    var page: Onboarding
    
    var body: some View {
        VStack {
            Text(page.title)
                .font(.largeTitle)
            Text(page.description ?? "")
                .font(.caption)
        }
    }
}
