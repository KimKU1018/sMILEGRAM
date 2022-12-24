//
//  UIView+Extension.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/20.
//

import UIKit

extension UIView {
    @IBInspectable var cornrRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
