//
//  ZXNavigationController.swift
//  Swift_Storyboard
//
//  Created by zhaoxu on 2017/9/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

import UIKit
import SVProgressHUD

class ZXNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor =  UIColor.init(red: 0.97, green: 0.31, blue: 0.31, alpha: 1.00)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"checkUserType_backward_9x15_"), style: UIBarButtonItemStyle.plain, target: self, action: NSSelectorFromString("back"))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func back() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        self.popViewController(animated: true)
    }
}
