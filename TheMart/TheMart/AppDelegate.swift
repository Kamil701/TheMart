//
//  AppDelegate.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


//        FirebaseApp.configure()
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .font: UIFont(name: "YourCustomFontName", size: 20) ?? UIFont.systemFont(ofSize: 20),
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

//        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [
//            .font: UIFont(name: "YourCustomFontName", size: 20) ?? UIFont.systemFont(ofSize: 20),
//        ]
//        
//        appearance.backgroundColor = .black
//        
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        

//        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [
//            .font: UIFont(name: "YourCustomFontName", size: 20) ?? UIFont.systemFont(ofSize: 20),
//        ]
//        
//        appearance.backgroundColor = .black
//        
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

