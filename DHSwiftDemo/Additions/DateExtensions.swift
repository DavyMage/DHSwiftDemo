//
//  DateExtensions.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/9/3.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import Foundation

extension Date {
    
    /// 年
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// 月
    public var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// 日
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /// 小时
    public var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// 分钟
    public var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    /// 秒
    public var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// 纳秒
    public var nanosecond: Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
    
    /// weekday
    public var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    /// isLeapMonth
    public var isLeapMonth: Bool {
        return Calendar.current.dateComponents([], from: self).isLeapMonth!
    }
    
    /// 是否是闰年
    public var isLeapYear: Bool {
        let year = self.year;
        return (year % 400 == 0 || ((year % 100 != 0) && (year % 4 == 0)));
    }
    
    /// 是否是今天
    public var isToday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: self) == format.string(from: Date())
    }
    
    /// 是否是昨天
    public var isYesterday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        return format.string(from: self) == format.string(from: yesterDay!)
    }
    
    /// 是否是明天
    public var isTomorrow: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        return format.string(from: self) == format.string(from: tomorrow!)
    }
    
    /// 时间戳（精确到毫秒）13位
    public static var milliStamp: Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
    
    /// 时间戳（精确到秒）10位
    public static var timestamp: Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    /// 格式化date
    ///
    /// - Parameter format: 格式
    /// - Returns: 格式化字符串
    public func formatterString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    
}
