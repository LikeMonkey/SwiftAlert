//
//  AppDelegate.swift
//  RVCustomAlertView
//
//  Created by 百年 on 2018/12/26.
//  Copyright © 2018年 百年. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

enum ShowType {
    case center,//默认是在中心缩放
    bottom //默认是从底部划出
}
protocol RVAlertAble where Self: UIView {
    ///背板蒙层
    var backView: UIView {set get}
    //弹窗方式
    var viewShowType :ShowType{set get}
    //
    var viewHeight : CGFloat{set get}
    ///配置弹窗布局
    func configSubviews()
    
}

extension RVAlertAble {

    func show(animated: Bool = true) {
        if let keyWindow = UIApplication.shared.keyWindow{
            backView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

            keyWindow.addSubview(backView)
            keyWindow.addSubview(self)
            configSubviews()

            backView.snp.remakeConstraints { (make) in
                make.left.right.top.bottom.equalToSuperview()
            }
            if self.viewShowType == ShowType.center{
                self.snp.makeConstraints { (make) in
                    make.center.equalToSuperview()
                }
            }
            if self.viewShowType == ShowType.bottom {
                self.snp.makeConstraints { (make) in
                          make.bottom.equalToSuperview().offset(viewHeight)
                          make.left.right.equalToSuperview()
                          make.height.equalTo(viewHeight)
                      }
            }
            
        }
        
        guard animated else {
            transform = CGAffineTransform.identity
            alpha = 1
            backView.alpha = 1
            return
        }
         if self.viewShowType == ShowType.center{
           transform = CGAffineTransform(scaleX: 0, y: 0)
                 }
        alpha = 0
        backView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {

            if self.viewShowType == ShowType.bottom{
                 self.transform = CGAffineTransform(translationX:0, y: -self.viewHeight)
            }
            if self.viewShowType == ShowType.center{
                self.transform = CGAffineTransform.identity
            }
            self.alpha = 1
            self.backView.alpha = 1
        })
    }
    
    func dismiss(animated: Bool = true) {
        guard animated else {
            removeFromSuperview()
            backView.removeFromSuperview()
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {
           
            if self.viewShowType == ShowType.bottom{
                            self.transform = CGAffineTransform(translationX:0, y: self.viewHeight)
                       }
                       if self.viewShowType == ShowType.center{
                           self.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
                       }
            self.alpha = 0
            self.backView.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
            self.backView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}
