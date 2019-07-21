//
//  AppDelegate.swift
//  CreditScore
//
//  Created by Magnus Holm on 19/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let apiService = APIService()
        let homeViewModel = HomeScreenViewModel(apiService: apiService)
        let homeViewController = HomeScreenViewController(viewModel: homeViewModel)
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        return true
    }
}

