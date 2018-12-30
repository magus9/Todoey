//
//  AppDelegate.swift
//  Todoey
//
//  Created by GUSTAFSSON MATS on 2018-11-28.
//  Copyright © 2018 GUSTAFSSON MATS. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print("Realm: \(Realm.Configuration.defaultConfiguration.fileURL!)")
        
        do{
            _ = try Realm()
        } catch {
            print("Error installing new realm, \(error)")
        }
        

        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
}

