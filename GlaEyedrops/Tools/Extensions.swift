//
//  Extensions.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/09.
//

import Foundation
import SwiftUI

///便利なextension

extension Array {
    ///Arrayのスライスをoptionalに(  get  set )
    subscript (safe index: Index) -> Element? {
        get{
            return indices.contains(index) ? self[index] : nil
        }
        set{
            if indices.contains(index) {
                if let new = newValue{
                    self[index] = new
                }
            }
        }
    }
}

extension Array where Element: Equatable {
    ///Arrayの要素を置き換える
    mutating func replace(before: Array.Element, after: Array.Element) {
        self = self.map { ($0 == before) ? after : $0 }
    }
}

extension Date {
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    ///同じ年か
    func isInSameYear(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .year)
    }
    ///同じ月か
    func isInSameMonth(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .month)
    }
    ///同じ週か
    func isInSameWeek(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear)
    }
    ///同じ日か
    func isInSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}

extension Date {
    ///create date
    func create(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year   = year   ?? calendar.component(.year,   from: self)
        components.month  = month  ?? calendar.component(.month,  from: self)
        components.day    = day    ?? calendar.component(.day,    from: self)
        components.hour   = hour   ?? calendar.component(.hour,   from: self)
        components.minute = minute ?? calendar.component(.minute, from: self)
        components.second = second ?? calendar.component(.second, from: self)
        return calendar.date(from: components) ?? Date()
    }
}

extension View {
    func popup<Content: View>(isPresented: Binding<Bool>, content: () -> Content) -> some View {
        return ZStack {
            self
            if isPresented.wrappedValue {
                content()
                    .opacity(isPresented.wrappedValue ? 1 : 0)
                    .scaleEffect(isPresented.wrappedValue ? 1 : 0)
                    .animation(.easeIn, value: 0.3)
            } else {
                Color.clear.opacity(0)
            }
        }
    }
}

///データサイズを変更する
extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
