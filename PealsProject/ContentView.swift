import SwiftUI

private enum PealsStyle {
    static let background = Color(red: 0.035, green: 0.035, blue: 0.055)
    static let card = Color(red: 0.095, green: 0.085, blue: 0.13)
    static let purple = Color(red: 0.65, green: 0.40, blue: 1.0)
    static let muted = Color.white.opacity(0.58)
}

struct ContentView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        ZStack {
            PealsStyle.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    heroCard

                    Text("EXPLORE")
                        .font(.caption.weight(.bold))
                        .tracking(2)
                        .foregroundStyle(PealsStyle.muted)

                    LazyVGrid(columns: columns, spacing: 12) {
                        featureCard(
                            title: "Tweaks",
                            subtitle: "Customize iOS",
                            symbol: "slider.horizontal.3"
                        )

                        featureCard(
                            title: "Wallpapers",
                            subtitle: "Make it yours",
                            symbol: "photo"
                        )

                        featureCard(
                            title: "My Setup",
                            subtitle: "Your configuration",
                            symbol: "iphone"
                        )

                        featureCard(
                            title: "Settings",
                            subtitle: "App preferences",
                            symbol: "gearshape"
                        )
                    }

                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(PealsStyle.purple)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Compatibility Center")
                                .font(.headline)

                            Text("Check your iOS version and device before applying modifications.")
                                .font(.subheadline)
                                .foregroundStyle(PealsStyle.muted)
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(PealsStyle.card)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    Text("PEALS PROJECT · EARLY BUILD")
                        .font(.caption2)
                        .tracking(1.5)
                        .foregroundStyle(PealsStyle.muted)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .padding(20)
            }
        }
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        HStack(spacing: 12) {
            Image(systemName: "sparkles")
                .font(.title2.bold())
                .foregroundStyle(PealsStyle.purple)
                .frame(width: 48, height: 48)
                .background(PealsStyle.card)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            VStack(alignment: .leading, spacing: 3) {
                Text("PEALS PROJECT")
                    .font(.headline.weight(.heavy))
                    .tracking(1.2)

                Text("YOUR DEVICE. YOUR STYLE.")
                    .font(.caption2)
                    .tracking(1)
                    .foregroundStyle(PealsStyle.muted)
            }

            Spacer()

            Image(systemName: "circle.grid.2x2.fill")
                .foregroundStyle(PealsStyle.purple)
                .font(.title3)
        }
        .padding(.top, 8)
    }

    private var heroCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label("PEALS DARK", systemImage: "moon.stars.fill")
                    .font(.caption.weight(.bold))
                    .tracking(1)

                Spacer()

                Text("BETA")
                    .font(.caption2.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(PealsStyle.purple.opacity(0.22))
                    .clipShape(Capsule())
            }
            .foregroundStyle(PealsStyle.purple)

            Text("YOUR DEVICE.\\nYOUR RULES.")
                .font(.system(size: 32, weight: .black, design: .rounded))
                .tracking(-0.8)
                .fixedSize(horizontal: false, vertical: true)

            Text("A new home for your iOS customization.")
                .font(.subheadline)
                .foregroundStyle(PealsStyle.muted)

            HStack(spacing: 8) {
                Image(systemName: "hammer.fill")
                Text("Explore customizations")
                Spacer()
                Image(systemName: "arrow.up.right")
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.white)
            .padding(14)
            .background(PealsStyle.purple.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding(22)
        .background {
            RoundedRectangle(cornerRadius: 26)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.18, green: 0.11, blue: 0.28),
                            PealsStyle.card,
                            Color(red: 0.08, green: 0.07, blue: 0.12)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
        .overlay {
            RoundedRectangle(cornerRadius: 26)
                .stroke(.white.opacity(0.08), lineWidth: 1)
        }
    }

    private func featureCard(
        title: String,
        subtitle: String,
        symbol: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Image(systemName: symbol)
                .font(.title2)
                .foregroundStyle(PealsStyle.purple)
                .frame(width: 44, height: 44)
                .background(PealsStyle.purple.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 13))

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(PealsStyle.muted)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 115, alignment: .leading)
        .padding(16)
        .background(PealsStyle.card)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.06), lineWidth: 1)
        }
    }
}

#Preview {
    ContentView()
}
