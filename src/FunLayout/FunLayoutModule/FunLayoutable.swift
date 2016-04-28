//
//  FunLayoutable.swift
//  FunLayout
//
//  Created by Sroik on 4/28/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

public protocol FunLayoutable {}

extension FunLayoutAttribute: FunLayoutable{}
extension UIView: FunLayoutable {}
extension CGFloat: FunLayoutable {}
extension Double: FunLayoutable {}
extension Float: FunLayoutable {}
extension Int: FunLayoutable {}

extension CGFloat {
    
   internal static func fun_CGFloatWithFunLayoutable(layoutable: FunLayoutable) -> CGFloat {
        switch layoutable {
        case let layoutableValue as CGFloat:
            return CGFloat(layoutableValue)
            
        case let layoutableValue as Double:
            return CGFloat(layoutableValue)
            
        case let layoutableValue as Float:
            return CGFloat(layoutableValue)
            
        case let layoutableValue as Int:
            return CGFloat(layoutableValue)
            
        default:
            return 0.0
        }
    }
    
}