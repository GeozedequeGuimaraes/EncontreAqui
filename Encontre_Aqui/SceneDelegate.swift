import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        // Add Genres tab to the existing TabBarController from Storyboard
        if let tabBarController = window?.rootViewController as? UITabBarController {
            let genresVC = GenresViewController()
            let genresNav = UINavigationController(rootViewController: genresVC)

            genresNav.navigationBar.prefersLargeTitles = true
            genresNav.navigationBar.barTintColor = UIColor(red: 0.314, green: 0.498, blue: 0.933, alpha: 1)
            genresNav.navigationBar.tintColor = .white
            genresNav.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Avenir-Medium", size: 19) ?? .systemFont(ofSize: 19)
            ]
            genresNav.navigationBar.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Avenir-Black", size: 34) ?? .boldSystemFont(ofSize: 34)
            ]

            genresNav.tabBarItem = UITabBarItem(
                title: "Generos",
                image: UIImage(systemName: "list.bullet.rectangle"),
                selectedImage: UIImage(systemName: "list.bullet.rectangle.fill")
            )

            tabBarController.viewControllers?.append(genresNav)

            // Unselected tab icons: white with opacity so they're visible on dark background
            let unselectedColor = UIColor(white: 1, alpha: 0.55)
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0.259, green: 0.290, blue: 0.404, alpha: 1)
            appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 0.953, green: 0.694, blue: 0.286, alpha: 1)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(red: 0.953, green: 0.694, blue: 0.286, alpha: 1)]
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
