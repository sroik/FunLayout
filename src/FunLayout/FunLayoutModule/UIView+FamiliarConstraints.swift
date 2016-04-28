//
//  UIView+FunElements.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit
import ObjectiveC

private struct FunAssociatedKeys {
    static var FamiliarContraintsKeyPath = "fun_familiar_constraitns";
}

extension UIView {
    
    var familiarConstraints: [NSLayoutConstraint] {
        get {
            let constraints = objc_getAssociatedObject(self, &FunAssociatedKeys.FamiliarContraintsKeyPath)
            if constraints != nil {
                return (constraints as! [NSLayoutConstraint])
            } else {
                let installedConstraints = [NSLayoutConstraint]()
                self.familiarConstraints = installedConstraints
             
                return installedConstraints
            }
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &FunAssociatedKeys.FamiliarContraintsKeyPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func fun_removeFamiliarConstraints(forFunLayoutAttribute funLayoutAttribute: FunLayoutAttribute) {
        for constraint in self.familiarConstraints {
            var needDeactivate = funLayoutAttribute.layoutAttributes.contains(constraint.firstAttribute)
            needDeactivate = needDeactivate && (constraint.relation == funLayoutAttribute.relation)
            
            if needDeactivate {
                constraint.active = false
            }
        }
    }
    
    func fun_addFamiliarConstraint(constraint: NSLayoutConstraint) {
        self.familiarConstraints.append(constraint)
    }
    
    public func fun_prepareForLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.fun_cleanLayout()
    }
    
    public func fun_cleanLayout() {
        for constraint in self.familiarConstraints {
            constraint.active = false;
        }
        
        self.familiarConstraints = [NSLayoutConstraint]()
    }
    
    public func fun_layoutIfNeededWithDuration(duration: NSTimeInterval) {
        UIView.animateWithDuration(duration, animations: {
            self.layoutIfNeeded()
        })
    }
    
}