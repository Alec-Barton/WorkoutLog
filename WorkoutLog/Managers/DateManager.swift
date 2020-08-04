//
//  DateManager.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

enum WeekdayName: Int {
    case mon = 1, tues, wed, thurs, fri, sat, sun
}

enum MonthName: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

class DateManager {
    static let shared = DateManager()
    
    var currentDate: Date {
        get {
            return Date()
        }
    }
}

