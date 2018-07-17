//
//  ZXThirdViewController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit

class ZXThirdViewController: ZXBaseViewController {

    @IBOutlet weak var firstContainerView: UIView!
    
    @IBOutlet weak var secondContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ZXLoginHandle.share.isLogin() {
            self.firstContainerView.isHidden = true
            self.secondContainerView.isHidden = false
        }
        else{
            self.firstContainerView.isHidden = false
            self.secondContainerView.isHidden = true
        }
    }
}
