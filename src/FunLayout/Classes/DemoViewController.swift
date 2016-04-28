//
//  ViewController.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    lazy var whiteView = UIView()
    lazy var greenView = UIView()
    lazy var blackView = UIView()
    lazy var redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupWhiteView()
        self.setupGreenView()
        self.setupBlackView()
        self.setupRedView()
    }
    
//MARK:- demo running
    
    func setupWhiteView() {
        whiteView.backgroundColor = UIColor.whiteColor()
        whiteView.translatesAutoresizingMaskIntoConstraints = false // You can use .fun_prepareForLayout() function
        self.view.addSubview(whiteView)
        
        whiteView.fun_edges == self.view
    }
    
    func setupGreenView() {
        greenView.backgroundColor = UIColor.greenColor()
        greenView.fun_prepareForLayout()
        self.view.addSubview(greenView)
        
        greenView.fun_size == self.view.fun_size*0.5
        greenView.fun_center == self.view
    }
    
    func setupBlackView() {
        blackView.backgroundColor = UIColor.blackColor()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blackView)
        
        blackView.fun_width == self.view.fun_width/4.0 + 50.0
        blackView.fun_center == self.view
        blackView.fun_height >= 123.0
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            [unowned self] in
            
            self.blackView.fun_height == 400.0
            self.blackView.fun_width == self.view.fun_width*0.8 - 100.0
            self.blackView.fun_centerX == self.view.fun_centerX + 50.0
            
            self.view.fun_layoutIfNeededWithDuration(0.5)
        }
    }
    
    func setupRedView() {
        let redView = UIView()
        
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
        
        redView.fun_prepareForLayout()
        redView.fun_bottom == blackView.fun_top - 10.0
        redView.fun_height == 20.0
        redView.fun_centerX == blackView
        redView.fun_width == blackView
    }

}

