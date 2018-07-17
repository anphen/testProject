//
//  ZXSettingViewController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

class ZXSettingViewController: ZXBaseViewController, ZXLoginHandleDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        ZXLoginHandle.share.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitLogin(_ sender: Any) {
      self.view.makeToastActivity(.center)
      let _ = ZXLoginHandle.share.exitLogin()
    }

    func didExitLogin(result: Bool) {
        if result {
            self.view.hideToastActivity()
            UIApplication.shared.keyWindow?.makeToast("退出登录成功", duration: 2, position: .center)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
