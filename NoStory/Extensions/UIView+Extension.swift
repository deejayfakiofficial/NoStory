//
//  UIView+Extension.swift
//  NoStory
//
//  Created by Stanislav Terentyev on 04.06.2021.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
