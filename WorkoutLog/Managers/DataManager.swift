//
//  DataManager.swift
//  WorkoutLog
//
//  Created by Alec Barton on 8/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

struct DateKey: Hashable {
    let year: Int
    let day: Int
    
    init (year: Int, day: Int) {
        self.year = year
        self.day = day
    }
    
    init (date: Date) {
        self.year = date.year
        self.day = date.dayOfYear
    }
}

class DataManager {
    
    static let shared = DataManager()
    
    private var dayDictionary: [DateKey:Day] = [:]
    
    func log(day: Day) {
        dayDictionary[day.key] = day
    }
    
    func getDay(for key: DateKey) -> Day? {
        return dayDictionary[key]
    }
}
