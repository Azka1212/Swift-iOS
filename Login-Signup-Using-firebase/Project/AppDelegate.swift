//
//  AppDelegate.swift
//  Project
//
//  Created by Azka  on 15/01/2024.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        startApp()
        
        return true
    }

    func startApp() {
        // Create an instance of LoginVC
        let loginVC = LoginVC()

        // Wrap LoginVC in a UINavigationController
        let navigationController = UINavigationController(rootViewController: loginVC)

        // Set the navigation controller as the root view controller
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }


}
extension UIViewController {
    var inNavController: UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}




