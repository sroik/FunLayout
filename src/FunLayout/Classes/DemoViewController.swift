//
//  ViewController.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.runDemo()
    }
    
//MARK:- demo running
    
    func runDemo() {
        
        /* background white view configurations */
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.whiteColor()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false // You can use .fun_prepareForLayout() function
        self.view.addSubview(backgroundView)

        backgroundView.fun_edges == self.view
        
        /* background green view configurations */
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        greenView.fun_prepareForLayout()
        self.view.addSubview(greenView)
        
        greenView.fun_size == self.view.fun_size*0.5
        greenView.fun_center == self.view
        
        /* black box configurations */
        
        let blackBox = UIView()
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blackBox)
        
        blackBox.fun_width == self.view.fun_width/4.0 + 50.0
        blackBox.fun_center == self.view
        blackBox.fun_height >= CGFloat(150.0)
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            blackBox.fun_height == 400.0
            blackBox.fun_width == self.view.fun_width*0.8 - 100.0
            blackBox.fun_centerX == self.view.fun_centerX + 50.0

            self.view.fun_layoutIfNeededWithDuration(0.5)
        }

        /* configure redLine view */

        let redLine = UIView()
        
        redLine.backgroundColor = UIColor.redColor()
        self.view.addSubview(redLine)
        
        redLine.fun_prepareForLayout()
        redLine.fun_bottom == blackBox.fun_top - 10.0
        redLine.fun_height == 20.0
        redLine.fun_centerX == blackBox
        redLine.fun_width == blackBox
        
    }

}

