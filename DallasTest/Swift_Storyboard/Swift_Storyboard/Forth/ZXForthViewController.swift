//
//  ZXForthViewController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

class ZXForthViewController: ZXBaseViewController {

    @IBOutlet weak var login: UIBarButtonItem!
    @IBAction func login(_ sender: Any) {
        if ZXLoginHandle.share.isLogin() {
            view.makeToast("已登录", duration: 1, position: .center)
        }
        else{
            self.performSegue(withIdentifier: "showLogin", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
