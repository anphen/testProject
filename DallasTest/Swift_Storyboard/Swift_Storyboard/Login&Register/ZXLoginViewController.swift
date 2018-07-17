//
//  ZXLoginViewController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

class ZXLoginViewController: ZXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        view.makeToastActivity(.center)
        ZXLoginHandle.share.loginSucces = {
            [unowned self] in
            self.view.hideToastActivity()
            UIApplication.shared.keyWindow?.makeToast("登录成功", duration: 2, position: .center)
            self.dismiss(animated: true, completion: nil)
        }
        let _ = ZXLoginHandle.share.goLogin()
    }
    
    @IBAction func cancelLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
