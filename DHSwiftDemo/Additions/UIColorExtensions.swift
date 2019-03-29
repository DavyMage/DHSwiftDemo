//
//  UIColor+Additions.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/19.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 随机颜色
    public class var randomColor: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    /// 16进制获取颜色
    ///
    /// - Parameter hex: 16进制数字 eg：0xffffff
    /// - Returns: UIColor
    public static func colorWithHex(hex:Int64) -> UIColor {
        return colorWithHex(hex: hex, alpha: 1.0)
    }
    
    /// 16进制获取颜色
    ///
    /// - Parameters:
    ///   - hex: 16进制数字 eg：0xffffff
    ///   - alpha: 透明度
    /// - Returns: UIColor
    public static func colorWithHex(hex:Int64,alpha:CGFloat) -> UIColor {
        let red = CGFloat((hex & 0xff0000) >> 16)/255.0
        let green = CGFloat((hex & 0xff00) >> 8)/255.0
        let blue = CGFloat(hex & 0xff)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 16进制字符串获取颜色
    ///
    /// - Parameter hexString: 16进制字符串 eg：0xffffff,ffffff,#ffffff
    /// - Returns: UIColor 格式错误：UIColor.red
    public static func colorWithHexString(hexString:String) -> UIColor {
        return colorWithHexString(hexString: hexString, alpha: 1.0)
    }
    
    /// 16进制字符串获取颜色
    ///
    /// - Parameters:
    ///   - hexString: 16进制字符串 eg：0xffffff,ffffff,#ffffff
    ///   - alpha: 透明度
    /// - Returns: UIColor 格式错误：UIColor.red
    public static func colorWithHexString(hexString:String, alpha:CGFloat) -> UIColor {
        var str = hexString
        if hexString.hasPrefix("0x") {
            str = hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            str = hexString.replacingOccurrences(of: "#", with: "")
        }
        if str.count == 6 {
            str = "0x" + str
        }else{
            return UIColor.red
        }
        let hex = strtoll((str as NSString).utf8String, nil, 0)
        return colorWithHex(hex: hex, alpha: alpha)
    }
    
    /// 通过RGB色值返回颜色 不透明
    ///
    /// - Parameters:
    ///   - red: red色值
    ///   - green: green色值
    ///   - blue: blue色值
    /// - Returns: UIColor
    public static func  colorWithRGB(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
        return colorWithRGB(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    /// 通过RGB色值返回颜色
    ///
    /// - Parameters:
    ///   - red: red色值
    ///   - green: green色值
    ///   - blue: blue色值
    ///   - alpha: 透明度
    /// - Returns: UIColor
    public static func colorWithRGB(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
       return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
