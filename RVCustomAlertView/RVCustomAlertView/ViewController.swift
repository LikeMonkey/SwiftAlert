//
//  ViewController.swift
//  RVCustomAlertView
//
//  Created by 百年 on 2018/12/26.
//  Copyright © 2018年 百年. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func showAlert(_ sender: UIButton) {
//
        let showView = texvAlertView.CreatAleat(titleStr: "测试", image: "lebron")
        showView.show()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



