//
//  Month.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

class Month {
    
    private let calendar = Calendar.current
    private let weeksInMonth: Int
    
    public let daysInMonth: Int
    public let startingDay: WeekdayName
    public let name: MonthName
    
    public var numberOfCells: Int {
        return weeksInMonth * 7
    }
    
    init? (month: Int, year: Int) {
        let components = DateComponents(calendar: calendar, year: year, month: month, day: 1)
        guard let date = components.date else { return nil }
        
        guard let name = MonthName(rawValue: month) else { return nil }
        guard let daysInMonth = calendar.range(of: .day, in: .month, for: date)?.last else { return nil }
        guard let weeksInMonth = calendar.range(of: .weekOfMonth, in: .month, for: date)?.last else {  return nil }
        var dayIndex = calendar.component(.weekday, from: date)
        dayIndex = dayIndex == 1 ? 7: dayIndex - 1
        guard let startingDay = WeekdayName(rawValue: dayIndex) else { return nil }

        let endComponents = DateComponents(calendar: calendar, year: year, month: month, day: daysInMonth - 1)
        guard let endDate = endComponents.date else { return nil }
        guard let endingDay = WeekdayName(rawValue: calendar.component(.weekday, from: endDate)) else { return nil }
        
        self.name = name
        self.daysInMonth = daysInMonth
        var weekCount = weeksInMonth
        weekCount = startingDay == .sun ? weekCount + 1 : weekCount
        weekCount = endingDay == .sun ? weekCount - 1 : weekCount
        self.weeksInMonth = weekCount
        self.startingDay = startingDay
        
    }
}
