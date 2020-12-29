//
//  Date+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 8/4/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

extension Date {
    
//    init? (year: Int, month: MonthName, day: Int ) {
//        let calendar = Calendar(identifier: .gregorian)
//        let components = DateComponents(year: year, month: month.rawValue, day: day)
//        guard let date = calendar.date(from: components) else { return nil }
//        self = date
//    }

    init? (year: Int, day: Int) {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, day: day)
        guard let date = calendar.date(from: components) else { return nil }
        self = date
    }
    
    init? (year: Int, month: Int, dayOfMonth: Int) {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: dayOfMonth)
        guard let date = calendar.date(from: components) else { return nil }
        self = date
    }
    
    var isToday: Bool {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.isDateInToday(self)
    }
    
    var year: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.dateComponents([.year], from: self).year ?? 0
    }
    
    var dayOfYear: Int {
        let calendar = Calendar(identifier: .gregorian)
        //TODO: total days in year
        return calendar.dateComponents([.day], from: self).day ?? 0 
    }
    
    func isSameDay (as date: Date) -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        return (calendar.compare(self, to: date, toGranularity: .day) == .orderedSame) ? true: false
    }
}
