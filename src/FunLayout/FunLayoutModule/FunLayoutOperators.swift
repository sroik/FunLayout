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
 * firstItem.fun_attribute {== or ~, <=, >=} secondItem.fun_attribute {*, /} multiplier {+, -} constant
 */

infix operator ~ { associativity left precedence 90 } //same as '==' operator
infix operator == { associativity left precedence 90 }
infix operator >= { associativity left precedence 91 }
infix operator <= { associativity left precedence 92 }

/* 
 * Why duplicated code?
 * Because I wanna receive compile error, 
 * when I use wrong type
 * neither FunLayoutAttribute, UIView nor CGFloat
 */

func ~(left: FunLayoutAttribute, right: FunLayoutAttribute) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .Equal)
}

func ~(left: FunLayoutAttribute, right: UIView) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .Equal)
}

func ~(left: FunLayoutAttribute, right: CGFloat) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .Equal)
}

func ==(left: FunLayoutAttribute, right: FunLayoutAttribute) -> [NSLayoutConstraint] {
    return (left ~ right)
}

func ==(left: FunLayoutAttribute, right: UIView) -> [NSLayoutConstraint] {
    return (left ~ right)
}

func ==(left: FunLayoutAttribute, right: CGFloat) -> [NSLayoutConstraint] {
    return (left ~ right)
}

//MARK:- less than or equal

func <=(left: FunLayoutAttribute, right: FunLayoutAttribute) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .LessThanOrEqual)
}

func <=(left: FunLayoutAttribute, right: UIView) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .LessThanOrEqual)
}

func <=(left: FunLayoutAttribute, right: CGFloat) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .LessThanOrEqual)
}

//MARK:- great than or equal

func >=(left: FunLayoutAttribute, right: FunLayoutAttribute) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .GreaterThanOrEqual)
}

func >=(left: FunLayoutAttribute, right: UIView) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .GreaterThanOrEqual)
}

func >=(left: FunLayoutAttribute, right: CGFloat) -> [NSLayoutConstraint] {
    return fun_activateConstraints(leftLayoutAttribute:left, right: right, relation: .GreaterThanOrEqual)
}

//MARK:- multiplier operators

func *(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.multiplier = right
    
    return layoutAttribute
}

func /(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.multiplier = 1.0/right

    return layoutAttribute
}

//MARK:- constants operators

func +(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.constant = right
    
    return layoutAttribute
}

func -(left: FunLayoutAttribute, right: CGFloat) -> FunLayoutAttribute {
    var layoutAttribute = left
    layoutAttribute.constant = -right
    
    return layoutAttribute
}

