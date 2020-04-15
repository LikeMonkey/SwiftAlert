//
//  RVAlertView.swift
//  RVCustomAlertView
//
//  Created by 百年 on 2018/12/26.
//  Copyright © 2018年 百年. All rights reserved.
//

import UIKit


class RVAlertView: UIView,RVAlertAble {
    
    
    var viewShowType: ShowType  = ShowType.center
    var viewHeight: CGFloat = 400
    lazy var backView: UIView = UIView()
    lazy var cancelButton: UIButton = {
        let cancel = UIButton()
        cancel.setTitle("Close", for: UIControlState.normal)
        cancel.setTitleColor(.orange, for: UIControlState.normal)
        cancel.addTarget(self, action: #selector(dissMiss), for: UIControlEvents.touchUpInside)
        return cancel
    }()
    
    @objc func dissMiss(){
        self.dismiss()
    }
    func configSubviews() {
        backgroundColor = .white
        layer.cornerRadius = 7
        layer.masksToBounds = true
        self.snapSubviews()
    }
    func snapSubviews() {
        
            addSubview(cancelButton)
            self.snp.makeConstraints { (make) in
          
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-100)
            make.top.equalToSuperview().offset(200)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
   
    
}
