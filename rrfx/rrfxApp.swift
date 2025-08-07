import SwiftUI

@main
struct rrfxApp: App {
    init() {
        setupNavigationBarAppearance()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                IntroductionScreen()
            }
            .tint(AppColors.secondaryColor)
        }
    }

    func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.secondaryColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.secondaryColor]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}
