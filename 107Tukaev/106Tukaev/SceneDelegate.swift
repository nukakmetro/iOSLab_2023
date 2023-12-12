//
//  SceneDelegate.swift
//  106Tukaev
//
//  Created by surexnx on 29.10.2023.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if let login = UserDefaults.standard.string(forKey: "login_save"), let password = UserDefaults.standard.string(forKey: "pass_save") {
            let check = CoreDataManager.shared.authCheck(login: login, pass: password)
            if check {
                window?.rootViewController = TapBarController()
            } else {
                window?.rootViewController = AuthViewController()
            }
        } else {
            window?.rootViewController = AuthViewController()
        }
        window?.makeKeyAndVisible()
    }
}
