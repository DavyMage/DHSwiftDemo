//
//  UIView+Addition.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/19.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// frame.origin.x
    public var left: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// frame.origin.y
    public var top: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var fram = self.frame
            fram.origin.y = newValue
            self.frame = fram
        }
    }
    
    /// frame.origin.x + frame.size.width
    public var right: CGFloat {
        get{
            return self.frame.origin.x + self.frame.width
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - frame.width
            self.frame = frame
        }
    }
    
    /// frame.origin.y + frame.size.height
    public var bottom: CGFloat {
        get{
            return self.frame.origin.y + self.frame.height
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue - frame.height
            self.frame = frame
        }
    }
    
    /// frame.size.width
    public var width: CGFloat {
        get{
            return self.frame.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// frame.size.height
    public var height: CGFloat {
        get{
            return self.frame.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /// center.x
    public var centerX: CGFloat {
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint.init(x: newValue, y: self.center.y)
        }
    }
    
    /// center.y
    public var centerY: CGFloat {
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint.init(x: self.center.y, y: newValue)
        }
    }
    
    /// frame.origin
    public var origin: CGPoint {
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    /// frame.size
    public var size: CGSize{
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    /// layer.borderColor
    @IBInspectable public var borderColor: UIColor? {
        get{
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set{
            guard let color = newValue else {
                return layer.borderColor = UIColor.clear.cgColor
            }
            layer.borderColor = color.cgColor
        }
    }
    
    /// layer.borderWidth
    @IBInspectable public var borderWidth: CGFloat {
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    /// layer.cornerRadius
    @IBInspectable public var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set{
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    /// layer.shadowOffset
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// layer.shadowOpacity
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// layer.shadowRadius
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /// Load view from nib.
    ///
    /// - Parameters:
    ///   - name: nib name.
    ///   - bundle: bundle of nib (default is nil).
    /// - Returns:  optional UIView (if applicable).
    public class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    ///  Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #000000).
    ///   - radius: shadow radius (default is 5).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    public func addShadow(color: UIColor = UIColor.colorWithHexString(hexString: "#000000"), radius: CGFloat = 5, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
}
