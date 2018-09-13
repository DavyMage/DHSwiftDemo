//
//  UIImageExtensions.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/9/4.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    //    MARK: - Properties
    
    /// base64String
    public var base64String: String {
        return UIImageJPEGRepresentation(self, 1.0)!.base64EncodedString()
    }
    
    /// Size in bytes of UIImage
    public var bytesSize:Int {
        return UIImageJPEGRepresentation(self, 1.0)?.count ?? 0
    }
    
    /// 渲染模式 .alwaysOriginal
    public var original: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }
    
    /// 渲染模式 模板模式（.alwaysTemplate）
    public var template: UIImage {
        return withRenderingMode(.alwaysTemplate)
    }
    
    //    MARK: - Methods
    
    /// image data
    ///
    /// - Parameter quality: 压缩比例（0 ~ 1）默认（0.5）
    /// - Returns: image data
    public func imageData(quality: CGFloat = 0.5) -> Data? {
        return UIImageJPEGRepresentation(self, quality)
    }
    
    /// 图片压缩
    ///
    /// - Parameter quality: 压缩比例（0 ~ 1）默认（0.5）
    /// - Returns: new image
    public func compressedImage(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = imageData(quality: quality) else {
            return nil
        }
        return UIImage.init(data: data)
    }
    
    /// 根据size返回新图片，可能会被拉伸
    public func imageResize(size: CGSize) -> UIImage {
        return imageByResize(size: size, opaque: false, scale: self.scale)
    }
    /// 根据size返回新图片，可能会被拉伸
    public func imageByResize(size: CGSize, opaque: Bool) -> UIImage {
        return imageByResize(size: size, opaque: opaque, scale: self.scale)
    }
    
    /// 根据size返回新图片，可能会被拉伸
    ///
    /// - Parameters:
    ///   - size: 宽高
    ///   - opaque: 是否透明
    ///   - scale: 缩放比例
    /// - Returns: 返回修改后的新图片
    public func imageByResize(size: CGSize, opaque: Bool, scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 以宽度为基准，根据图片比例缩放
    ///
    /// - Parameter width: 宽度
    /// - Returns: 修改后图片
    public func imageByScaled(width: CGFloat) -> UIImage {
        let scale = width / size.width
        let newSize: CGSize = CGSize(width: width, height: size.height * scale)
        return imageResize(size: newSize)
    }
    
    /// 以高度为基准，根据图片比例缩放
    ///
    /// - Parameter height: 高
    /// - Returns: 修改后图片
    public func imageByScaled(height: CGFloat) -> UIImage {
        let scale = height / size.height
        let newSize: CGSize = CGSize(width: size.width * scale, height: height)
        return imageResize(size: newSize)
    }
    
    /// 裁剪图片
    ///
    /// - Parameter rect: 坐标
    /// - Returns: 裁剪过后的图片
    public func imageByCrop(rect: CGRect) -> UIImage {
        guard rect.size.height < size.height && rect.size.height < size.height else {
            return self
        }
        guard let image: CGImage = cgImage?.cropping(to: rect) else {
            return self
        }
        return UIImage(cgImage: image)
    }
    
    /// 以颜色创建图片
    ///
    /// - Parameter color: UIColor
    /// - Returns: 图片
    public static func imageByColor(color: UIColor) -> UIImage {
        return imageByColor(color: color, size: CGSize(width: 1.0, height: 1.0))
    }
    
    /// 以颜色和大小创建图片
    ///
    /// - Parameters:
    ///   - color: UIColor
    ///   - size: 大小
    /// - Returns: 图片
    public static func imageByColor(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context!.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 图片圆角
    ///
    /// - Parameter radius: 半径
    /// - Returns: image
    public func imageRoundCorner(radius: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
