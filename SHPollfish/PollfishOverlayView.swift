//
//  PollfishOverlayView.swift
//  SHPollfish
//
//  Created by Saeid Hosseinabadi on 2/7/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import Foundation
import UIKit
import AdSupport

public protocol SHPolisOverViewDelegate{
    
    func dismissPassValue(_ param: (String, String, String))
}

public class SHPollfishOverlayView: UIViewController{
    
    // --VARIABLES
    // Public
    public var delegate: SHPolisOverViewDelegate?
    public var viewModel: SHViewModel?
    
    // Private
    fileprivate var webView: UIWebView!
    fileprivate var exitButton: UIButton!
    fileprivate var topTextField: UITextField!
    fileprivate var middleTextField: UITextField!
    fileprivate var bottomTextField: UITextField!
    fileprivate var callBack: (String, String, String)?
    
    // --FUNCTIONS
    
    
    // View Did Load
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        self.initView()
        if let viewM = viewModel{
        if viewM.url != nil && viewM.myIDFA != nil{
            
            self.webView.loadRequest(URLRequest(url: viewM.url!))
            self.middleTextField.text = viewM.myIDFA
        }
            self.topTextField.text = viewM.model.param1
        self.bottomTextField.text = viewM.model.param2
        }
    }
    
}


extension SHPollfishOverlayView{
    
    
    fileprivate func initView(){
        
        self.exitButton = UIButton()
        self.topTextField = UITextField()
        self.bottomTextField = UITextField()
        self.middleTextField = UITextField()
        self.webView = UIWebView()
        self.webView.delegate = self
        self.view.addSubview(webView)
        self.view.addSubview(topTextField)
        self.view.addSubview(bottomTextField)
        self.view.addSubview(exitButton)
        self.view.addSubview(middleTextField)
        self.constraint()
        self.topTextField.textAlignment = .center
        self.middleTextField.textAlignment = .center
        self.bottomTextField.textAlignment = .center
        self.exitButton.setTitle("X", for: .normal)
        self.exitButton.setTitleColor(.black, for: .normal)
        self.exitButton.addTarget(self, action: #selector(exitAction), for: .touchUpInside)
        
    }
    
    // Set Constraint
    fileprivate func constraint(){
    
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.exitButton.translatesAutoresizingMaskIntoConstraints = false
        self.topTextField.translatesAutoresizingMaskIntoConstraints = false
        self.bottomTextField.translatesAutoresizingMaskIntoConstraints = false
        self.middleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            
            self.webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            self.webView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            self.webView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            self.webView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
            self.exitButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
            self.exitButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
            self.topTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
            self.topTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
            self.topTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
            self.middleTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            self.middleTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            self.middleTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            self.bottomTextField.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
            self.bottomTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
            self.bottomTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
            
        } else {
            
            // Fallback on earlier versions
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            self.webView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
            self.exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
            self.exitButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
            self.topTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
            self.topTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
            self.topTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
            self.middleTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.middleTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            self.middleTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            self.bottomTextField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 5).isActive = true
            self.bottomTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
            self.bottomTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
        }
        
        
        self.exitButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.exitButton.heightAnchor.constraint(equalTo: self.exitButton.widthAnchor, multiplier: 1).isActive = true
        self.topTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.bottomTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.middleTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    // Exit
    @objc func exitAction(){
        if let callBack = self.callBack{ self.delegate!.dismissPassValue(callBack)}else{ self.delegate!.dismissPassValue(("Sample","Sample","Sample"))}
        
        self.animationForDissmiss(self.parent!)
    }
}

extension SHPollfishOverlayView: UIWebViewDelegate{
    
    // Fail Load WebSite
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        exitAction()
    }
}
