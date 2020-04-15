//
//  texvAlertView.swift
//  RVCustomAlertView
//
//  Created by ios 001 on 2019/12/31.
//  Copyright © 2019 百年. All rights reserved.
//

import UIKit

class texvAlertView: UIView,RVAlertAble {

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
   
    class func CreatAleat(titleStr:String,image:String) ->(texvAlertView){
        let showView = texvAlertView()
        return showView
    }
  
    func configSubviews() {
           backgroundColor = .white
           layer.cornerRadius = 7
           layer.masksToBounds = true
           self.initializeView()
       }
       
    private func   initializeView(){
      
        self.addSubview(cancelButton)
        
      
       
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 100, height: 50))
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }
}
