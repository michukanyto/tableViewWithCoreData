//
//  AppDelegate.swift
//  tableViewWithCoreData
//
//  Created by Marlon Escobar on 2019-04-29.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = ViewController(persistenceManager: PersistenceManager.share)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

}

