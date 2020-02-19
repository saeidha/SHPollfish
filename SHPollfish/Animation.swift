//
//  Animation.swift
//  SHPollfish
//
//  Created by Saeid Hosseinabadi on 2/7/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    public func animationForLoad(_ tovc: UIViewController) {

        self.addChild(tovc)
        self.view.addSubview(tovc.view)
        tovc.willMove(toParent: self)
        tovc.view.frame.origin.x = self.view.bounds.width
        
        UIView.transition(with: self.view, duration: 0.5, options: UIView.AnimationOptions.beginFromCurrentState, animations: {
            tovc.view.frame = self.view.frame
            }, completion: { (finish) in
                tovc.didMove(toParent: self)
                print("Panel is Opened")
        })
    }
    
    public func animationForDissmiss(_ parentVC: UIViewController) {
        
        UIView.transition(with: self.view, duration: 0.5, options: UIView.AnimationOptions.beginFromCurrentState, animations: {
            self.view.frame.origin.x = parentVC.view.bounds.width
            }, completion: { (finish) in
                self.removeFromParent()
                self.view.removeFromSuperview()
                print("Panel is Closed")
        })
    }
}
