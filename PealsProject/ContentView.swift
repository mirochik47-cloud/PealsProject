
import SwiftUI

private enum PealsStyle {
    static let bg = Color(red: 0.018, green: 0.016, blue: 0.035)
    static let card = Color(red: 0.065, green: 0.045, blue: 0.12)
    static let purple = Color(red: 0.62, green: 0.22, blue: 1.0)
    static let muted = Color.white.opacity(0.62)
}

private enum PealsTab: String, CaseIterable {
    case home = "Home"
    case tweaks = "Tweaks"
    case wallpapers = "Wallpapers"
    case setup = "Setup"
    case settings = "Settings"

    var symbol: String {
        switch self {
        case .home: return "house.fill"
        case .tweaks: return "slider.horizontal.3"
        case .wallpapers: return "photo"
        case .setup: return "iphone"
        case .settings: return "gearshape.fill"
        }
    }

    var subtitle: String {
        switch self {
        case .home: return "YOUR DEVICE. YOUR RULES."
        case .tweaks: return "MAKE IOS YOURS."
        case .wallpapers: return "A NEW LOOK EVERY DAY."
        case .setup: return "YOUR PERSONAL CONFIGURATION."
        case .settings: return "TUNE YOUR EXPERIENCE."
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: PealsTab = .home

    var body: some View {
        ZStack {
            PealsStyle.bg.ignoresSafeArea()

            VStack(spacing: 0) {
                Group {
                    switch selectedTab {
                    case .home:
                        homeScreen
                    case .tweaks:
                        sectionScreen(
                            title: "Tweaks",
                            description: "Personalize the way your device looks and feels.",
                            symbol: "slider.horizontal.3",
                            items: [
                                ("Interface", "Appearance and visual options"),
                                ("Animations", "Motion and transition settings"),
                                ("Status Bar", "Explore status bar customization")
                            ]
                        )
                    case .wallpapers:
                        sectionScreen(
                            title: "Wallpapers",
                            description: "Build your own visual style.",
                            symbol: "photo",
                            items: [
                                ("Dark Collection", "Deep blacks and violet tones"),
                                ("Neon Collection", "Bright colors and glowing accents"),
                                ("My Wallpapers", "Your saved backgrounds")
                            ]
                        )
                    case .setup:
                        sectionScreen(
                            title: "My Setup",
                            description: "Your device and preferred configuration.",
                            symbol: "iphone",
                            items: [
                                ("My Device", "Device information"),
                                ("My Preferences", "Your selected appearance"),
                                ("Compatibility", "Check supported features")
                            ]
                        )
                    case .settings:
                        sectionScreen(
                            title: "Settings",
                            description: "Configure your Peals Project experience.",
                            symbol: "gearshape.fill",
                            items: [
                                ("Appearance", "Dark interface"),
                                ("About Peals", "Version and project information"),
                                ("Privacy", "Privacy information")
                            ]
                        )
                    }
                }

                Spacer(minLength: 4)
                bottomBar
            }
        }
        .preferredColorScheme(.dark)
    }

    private var homeScreen: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                header

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Label("PEALS DARK", systemImage: "moon.stars.fill")
                            .font(.caption.bold())
                            .foregroundStyle(PealsStyle.purple)
                        Spacer()
                        Text("BETA")
                            .font(.caption2.bold())
                            .padding(7)
                            .background(PealsStyle.purple.opacity(0.25))
                            .clipShape(Capsule())
                    }

                    Text("YOUR DEVICE.\nYOUR RULES.")
                        .font(.system(size: 30, weight: .black))

                    Text("A new home for your iOS customization.")
                        .font(.subheadline)
                        .foregroundStyle(PealsStyle.muted)

                    Button {
                        selectedTab = .tweaks
                    } label: {
                        Label("Explore customizations", systemImage: "wand.and.stars")
                            .font(.subheadline.bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(PealsStyle.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 13))
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [
                            Color(red: 0.20, green: 0.08, blue: 0.35),
                            PealsStyle.card
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(PealsStyle.purple.opacity(0.5), lineWidth: 1)
                }

                Text("EXPLORE")
                    .font(.caption.bold())
                    .tracking(2)
                    .foregroundStyle(PealsStyle.muted)

                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: 12
                ) {
                    homeCard("Tweaks", "Customize iOS", "slider.horizontal.3", .tweaks)
                    homeCard("Wallpapers", "Make it yours", "photo", .wallpapers)
                    homeCard("My Setup", "Your configuration", "iphone", .setup)
                    homeCard("Settings", "App preferences", "gearshape.fill", .settings)
                }

                HStack(spacing: 12) {
                    Image(systemName: "shield.lefthalf.filled")
                        .font(.title2)
                        .foregroundStyle(PealsStyle.purple)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Compatibility Center")
                            .font(.headline)
                        Text("Review device compatibility options.")
                            .font(.caption)
                            .foregroundStyle(PealsStyle.muted)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(PealsStyle.card)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .padding(20)
        }
    }

    private var header: some View {
        HStack(spacing: 12) {
            Image("PealsIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 4) {
                Text("PEALS PROJECT")
                    .font(.headline.bold())
                    .tracking(1)

                Text(selectedTab.subtitle)
                    .font(.system(size: 9))
                    .foregroundStyle(PealsStyle.muted)
            }

            Spacer()

            Image(systemName: "circle.grid.3x3.fill")
                .foregroundStyle(PealsStyle.purple)
        }
        .padding(.top, 10)
    }

    private func homeCard(
        _ title: String,
        _ subtitle: String,
        _ symbol: String,
        _ tab: PealsTab
    ) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                Image(systemName: symbol)
                    .font(.title2)
                    .foregroundStyle(PealsStyle.purple)

                Text(title).font(.headline)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(PealsStyle.muted)
            }
            .frame(maxWidth: .infinity, minHeight: 95, alignment: .leading)
            .padding(15)
            .background(PealsStyle.card)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.white.opacity(0.08), lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }

    private func sectionScreen(
        title: String,
        description: String,
        symbol: String,
        items: [(String, String)]
    ) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                header

                HStack(spacing: 14) {
                    Image(systemName: symbol)
                        .font(.system(size: 28))
                        .foregroundStyle(PealsStyle.purple)
                        .frame(width: 60, height: 60)
                        .background(PealsStyle.purple.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 18))

                    VStack(alignment: .leading, spacing: 5) {
                        Text(title)
                            .font(.system(size: 28, weight: .bold))
                        Text(description)
                            .font(.subheadline)
                            .foregroundStyle(PealsStyle.muted)
                    }
                }

                ForEach(items, id: \.0) { item in
                    HStack(spacing: 14) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.0).font(.headline)
                            Text(item.1)
                                .font(.caption)
                                .foregroundStyle(PealsStyle.muted)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.caption.bold())
                            .foregroundStyle(PealsStyle.purple)
                    }
                    .padding(18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(PealsStyle.card)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }

                Text("More features are coming soon.")
                    .font(.caption)
                    .foregroundStyle(PealsStyle.muted)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
            }
            .padding(20)
        }
    }

    private var bottomBar: some View {
        HStack(spacing: 0) {
            ForEach(PealsTab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 5) {
                        Image(systemName: tab.symbol)
                            .font(.system(size: 18))
                        Text(tab.rawValue)
                            .font(.system(size: 9))
                    }
                    .foregroundStyle(
                        selectedTab == tab ? PealsStyle.purple : PealsStyle.muted
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.top, 8)
        .background(PealsStyle.bg)
    }
}

#Preview {
    ContentView()
}

