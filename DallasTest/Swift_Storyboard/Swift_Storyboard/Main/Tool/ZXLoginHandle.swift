//
//  ZXLoginHandle.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

protocol ZXLoginHandleDelegate {
    func didExitLogin(result : Bool)
}

class ZXLoginHandle: NSObject {
    
    static let share = ZXLoginHandle()
    
    var delegate : ZXLoginHandleDelegate?
    
    var loginVC : UIViewController
    
    var loginSucces : (() -> Void)?
    
    let loginKey = "isLogin"
    
    override init() {
        self.loginVC = UIStoryboard.init(name: "login&Register", bundle: Bundle.main).instantiateInitialViewController()!
        super.init()
    }

    
    func isLogin() -> Bool {
        let isLogin = UserDefaults.standard.bool(forKey: loginKey)
        if isLogin {
            return true
        }
        else{
            return false
        }
    }
    
    func showLogin() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self.loginVC, animated: true, completion: nil)
    }
    
    func hiddenLogin() {
        self.loginVC.dismiss(animated: true, completion: nil)
    }
    
    func goLogin() -> Bool {
        UserDefaults.standard.set(true, forKey: loginKey)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            if let success = self.loginSucces {
                success()
            }
        }
        return true
    }
    
    func exitLogin() -> Bool {
        UserDefaults.standard.removeObject(forKey: loginKey)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            if let delegate = self.delegate {
                delegate.didExitLogin(result: true)
            }
        }
        return true
    }
}
