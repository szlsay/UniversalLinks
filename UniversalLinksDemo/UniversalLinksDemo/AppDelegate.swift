//
//  AppDelegate.swift
//  UniversalLinksDemo
//
//  Created by 沈兆良 on 2018/1/2.
//  Copyright © 2018年 沈兆良. All rights reserved.
//

import UIKit
import WebKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var webController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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

    // Called on the main thread as soon as the user indicates they want to continue an activity in your application. The NSUserActivity object may not be available instantly,
    // so use this as an opportunity to show the user that an activity will be continued shortly.
    // For each application:willContinueUserActivityWithType: invocation, you are guaranteed to get exactly one invocation of application:continueUserActivity: on success,
    // or application:didFailToContinueUserActivityWithType:error: if an error was encountered.
    
    //一旦用户指出他们想要在应用程序中继续活动，就在主线程上调用。 NSUserActivity对象可能不是即时可用的，
    //以此为契机向用户展示一个活动很快就会继续。
    //对于每个应用程序：willContinueUserActivityWithType：invocation，你保证得到应用程序的一个调用：continueUserActivity：在成功，
    //或应用程序：didFailToContinueUserActivityWithType：错误：如果遇到错误。
    
    @available(iOS 8.0, *)
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        print(#function)
        print(userActivityType)
        return true
    }
    
    
    // Called on the main thread after the NSUserActivity object is available. Use the data you stored in the NSUserActivity object to re-create what the user was doing.
    // You can create/fetch any restorable objects associated with the user activity, and pass them to the restorationHandler. They will then have the UIResponder restoreUserActivityState: method
    // invoked with the user activity. Invoking the restorationHandler is optional. It may be copied and invoked later, and it will bounce to the main thread to complete its work and call
    // restoreUserActivityState on all objects.
    
    // 在NSUserActivity对象可用之后调用主线程。 使用存储在NSUserActivity对象中的数据来重新创建用户正在做的事情。
    // 可以创建/获取与用户活动相关的任何可恢复的对象，并将它们传递给restorationHandler。 他们将有UIResponder restoreUserActivityState：方法
    // 用用户活动调用。 调用restorationHandler是可选的。 它可能会被复制和调用，它会弹跳到主线程来完成它的工作和调用
    // 所有对象上的restoreUserActivityState。
    @available(iOS 8.0, *)
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Swift.Void) -> Bool {
        print(#function)
        logInfo(continue: userActivity)
        
        if userActivity.activityType == "NSUserActivityTypeBrowsingWeb" {
            let wkWebView = WKWebView()
            wkWebView.frame = (window?.frame)!
            wkWebView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            wkWebView.load(URLRequest(url: userActivity.webpageURL!))
            
            let button = UIButton()
            button.frame = CGRect(x: 20, y: 40, width: 80, height: 40)
            button.setTitle("＜Back", for: .normal)
            button.setTitleColor(.red, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            button.layer.cornerRadius = 20
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(backController), for: .touchUpInside)
            let controller = UIViewController()
            controller.view.addSubview(wkWebView)
            controller.view.addSubview(button)
            webController = controller
            window?.rootViewController?.present(controller, animated: true, completion: nil)
        }
        return true
    }
    
    @objc func backController() {
        webController?.dismiss(animated: true, completion: nil)
    }

    // If the user activity cannot be fetched after willContinueUserActivityWithType is called, this will be called on the main thread when implemented.
    
    // 如果在调用了willContinueUserActivityWithType之后，用户活动无法被获取，则在主线程上执行时会调用该活动。
    @available(iOS 8.0, *)
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
         print(#function)
         print(userActivityType)
    }
    
    
    // This is called on the main thread when a user activity managed by UIKit has been updated. You can use this as a last chance to add additional data to the userActivity.
    
    //当UIKit管理的用户活动已经更新时，这在主线程上调用。 您可以使用此作为最后的机会添加额外的数据到userActivity。
    @available(iOS 8.0, *)
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        print(#function)
        logInfo(continue: userActivity)
    }
    
    func logInfo(continue userActivity: NSUserActivity)  {
        print(userActivity)
        print(userActivity.activityType)
        print(userActivity.title as String!)
        print(userActivity.userInfo as [AnyHashable:Any]!)
        print(userActivity.webpageURL as URL!)
        print(userActivity.referrerURL as URL!)
        print(userActivity.expirationDate as Date!)
        print(userActivity.keywords)
    }

}

