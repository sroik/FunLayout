//
//  FunLayoutOperators.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

/*
 * Below usage formula:
 * firstItem.fun_attribute {== or ~, <=, >=} secondItem.fun_attribute % priority {*, /} multiplier {+, -} constant
 */

infix operator ~ {
/* same as '==' operator */
    associativity left
    precedence 90
}

infix operator %{
    associativity left
    precedence 91
}

public func ~(left: FunLayoutAttribute, right: FunLayoutable) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .Equal)
}

public func ==(left: FunLayoutAttribute, right: FunLayoutable) -> [NSLayoutConstraint] {
    return (left ~ right)
}

//MARK:- less than or equal

public func <=(left: FunLayoutAttribute, right: FunLayoutable) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .LessThanOrEqual)
}

//MARK:- great than or equal

public func >=(left: FunLayoutAttribute, right: FunLayoutable) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .GreaterThanOrEqual)
}

//MARK:- multiplier operators

public func *(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.multiplier = right

    return layoutAttribute
}

public func /(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.multiplier = 1.0/right
    
    return layoutAttribute
}

//MARK:- constants operators

public func +(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.constant = right
    
    return layoutAttribute
}

public func -(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.constant = -right
    
    return layoutAttribute
}

//MARK:- priority operators

public func %(left: FunLayoutAttribute, right: UILayoutPriority) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.priority = right
    
    return layoutAttribute
}

