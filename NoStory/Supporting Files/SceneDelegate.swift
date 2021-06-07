//
//  SceneDelegate.swift
//  NoStory
//
//  Created by Stanislav Terentyev on 04.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = WelcomeViewController()
        window.makeKeyAndVisible()
        self.window = window
    }

}

