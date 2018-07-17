//
//  ZXFirstViewController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

class ZXFirstViewController: ZXBaseViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginHandle = ZXLoginHandle.share
        guard loginHandle.isLogin() else {
            self.performSegue(withIdentifier: "showLogin", sender: self)
            return
        }
    }
    
    //手动调用seguediao, 拦截赋值
    override func prepare(for performSegue: UIStoryboardSegue, sender: Any?) {
        if performSegue.identifier == "showLogin" {
            print("\(performSegue.source) + \(performSegue.destination)")
        }
    }
}
