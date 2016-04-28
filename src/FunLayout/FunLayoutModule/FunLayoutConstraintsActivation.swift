//
//  FunnyLayout.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

internal func fun_activateConstraints(var leftLayoutAttribute leftLayoutAttribute: FunLayoutAttribute, right: Any, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    
    leftLayoutAttribute.relation = relation
    leftLayoutAttribute.owner?.fun_removeFamiliarConstraints(forFunLayoutAttribute: leftLayoutAttribute)
    
    let rightLayoutAttribute = fun_suitableRightLayoutAttribute(leftLayoutAttribute, right: right)
    assert(rightLayoutAttribute != nil, "wrong right expression type, check it pls. It must be one of FunLayoutAttribute, UIView, CGFloat")
    
    let constraints = fun_layoutConstraints(leftLayoutAttribute: leftLayoutAttribute, rightLayoutAttribute: rightLayoutAttribute!, relation: relation)
    
    for constraint in constraints {
        constraint.active = true
        leftLayoutAttribute.owner?.fun_addFamiliarConstraint(constraint)
    }
    
    return constraints
}

private func fun_layoutConstraints(leftLayoutAttribute leftLayoutAttribute: FunLayoutAttribute, rightLayoutAttribute: FunLayoutAttribute, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    
    assert(leftLayoutAttribute.owner != nil, "left funLayoutAttribute owner is nil assertion")
    
    var constraints = [NSLayoutConstraint]()
    
    for i in 0 ..< leftLayoutAttribute.layoutAttributes.count {
    
        let firstAttribute = leftLayoutAttribute.layoutAttributes[i]
        
        let secondAttributeIndex = (rightLayoutAttribute.layoutAttributes.count > i) ? i : 0
        let secondAttribute = rightLayoutAttribute.layoutAttributes[secondAttributeIndex]
        
        let constraint = NSLayoutConstraint(item: leftLayoutAttribute.owner!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: rightLayoutAttribute.owner,
            attribute: secondAttribute,
            multiplier: rightLayoutAttribute.multiplier,
            constant: rightLayoutAttribute.constant)
    
        constraint.priority = rightLayoutAttribute.priority
        
        constraints.append(constraint)
    }
    
    return constraints
}

private func fun_suitableRightLayoutAttribute(leftLayoutAttribute: FunLayoutAttribute, right: Any) -> FunLayoutAttribute? {
    var layoutAttribute = FunLayoutAttribute(attributes: [.NotAnAttribute], owner: nil)
    
    switch right {
    case let funLayoutAttribute as FunLayoutAttribute:
        layoutAttribute = funLayoutAttribute
        break
        
    case let view as UIView:
        layoutAttribute.owner = view
        layoutAttribute.layoutAttributes = leftLayoutAttribute.layoutAttributes
        break
        
    case let constant as CGFloat:
        layoutAttribute.constant = constant
        break
        
    case let constant as Double:
        layoutAttribute.constant = CGFloat(constant)
        break
        
    case let constant as Float:
        layoutAttribute.constant = CGFloat(constant)
        break
        
    case let constant as Int:
        layoutAttribute.constant = CGFloat(constant)
        break
        
    default:
        return nil
    }
    
    return layoutAttribute
}
