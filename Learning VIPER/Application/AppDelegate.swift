//
//  AppDelegate.swift
//  Learning VIPER
//
//  Created by Khairil Ushan on 11/9/17.
//  Copyright © 2017 Khairil Ushan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppContainer.shared.inject()

        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = SearchRepositoryWireframeImpl.createSearchRepository()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()

        return true
    }

}

