//
//  FunLayoutAttribute.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

internal struct FunLayoutAttribute {
    var layoutAttributes: [NSLayoutAttribute]
    var owner: UIView?
    
    var constant: CGFloat = 0.0
    var multiplier: CGFloat = 1.0
    var priority: UILayoutPriority = UILayoutPriorityRequired
    var relation: NSLayoutRelation = NSLayoutRelation.Equal
    
    init(attributes: [NSLayoutAttribute], owner: UIView?) {
        self.layoutAttributes = attributes
        self.owner = owner
    }
}

//MARK:- fun layout attributes handling

extension UIView {
    
    var fun_width: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Width], owner: self) }
   
    var fun_height: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Height], owner: self) }
    
    var fun_centerX: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.CenterX], owner: self) }
    
    var fun_centerY: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.CenterY], owner: self) }
    
    var fun_left: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Left], owner: self) }
    
    var fun_right: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Right], owner: self) }

    var fun_top: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Top], owner: self) }
    
    var fun_bottom: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Bottom], owner: self) }
    
    var fun_center: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.CenterX, .CenterY], owner: self) }
    
    var fun_edges: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Top, .Left, .Bottom, .Right], owner: self) }
    
    var fun_size: FunLayoutAttribute { return FunLayoutAttribute(attributes: [.Width, .Height], owner: self) }
}
