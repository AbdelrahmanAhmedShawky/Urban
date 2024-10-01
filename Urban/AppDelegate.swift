//
//  AppDelegate.swift
//  Urban
//
//  Created by Zain on 26/08/2024.
//

import UIKit
import Siren
import GoogleMaps
import GooglePlaces
import SideMenuSwift
import GoogleSignIn
import Firebase
import FirebaseCore
import FirebaseMessaging
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey(Config.googleApiKey)
        GMSServices.provideAPIKey(Config.googleApiKey)
        forceUpdateSetup()
        setRootVC()
        window?.makeKeyAndVisible()
        return true
    }
    func forceUpdateSetup() {
        let siren = Siren.shared
        siren.rulesManager = RulesManager(globalRules: .critical,
                                          showAlertAfterCurrentVersionHasBeenReleasedForDays: 1)
        if languageBool {
            siren.presentationManager = PresentationManager(forceLanguageLocalization: .arabic)
        } else {
            siren.presentationManager = PresentationManager(forceLanguageLocalization: .english)
        }
        siren.wail()
    }

}
extension AppDelegate {
    fileprivate func setRootVC() {
        if SessionManager.isLoggedIn()
        {
            Coordinator.gotoTabbar()
        }else
        {
            Coordinator.IntroScreen()
        }
    }
}
