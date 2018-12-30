//
//  AppDelegate.swift
//  whistle
//
//  Created by Sparsh Chauhan on 12/11/18.
//  Copyright © 2018 Sparsh Chauhan. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(2);
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        
        //let defaults = UserDefaults.standard                  IMMMMPORTTANNNNNTttttt
        //if defaults.object(forKey: "isFirstTime") == nil {    IMMMMPORTTANNNNNTttttt
            //defaults.set("No", forKey:"isFirstTime")          IMMMMPORTTANNNNNTttttt
            //defaults.synchronize()                            IMMMMPORTTANNNNNTttttt
        
        if ((UserDefaults.standard.object(forKey: "registrationdone") == nil) || (String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestion")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestion")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "firstSecurityQuestionsAnswer")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "secondSecurityQuestionsAnswer")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "firstPhoneNumber")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "secondPhoneNumber")) == "nil") || (String(describing: UserDefaults.standard.object(forKey: "thirdPhoneNumber")) == "nil"))
        {
            
            var mainView: UIStoryboard!
            mainView = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller : UIViewController = mainView.instantiateViewController(withIdentifier: "ILA") as UIViewController
            self.window!.rootViewController = viewcontroller
            self.window!.makeKeyAndVisible()
            
            UserDefaults.standard.set("walking", forKey: "directionswalkingordriving")
            UserDefaults.standard.set(0, forKey: "silentsostriggered")  //0 means not triggered 1 means triggered
            UserDefaults.standard.set(180, forKey: "timer")
        }
        //}                                                     IMMMMPORTTANNNNNTttttt
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void){
        
        if (UserDefaults.standard.integer(forKey: "silentsostriggered") == 1)
        {
            let vc = window?.rootViewController as? ViewController
            vc?.timer?.invalidate()
            vc?.timer = nil
            vc?.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(vc?.timeraction), userInfo: nil, repeats: true)
        }
    
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

