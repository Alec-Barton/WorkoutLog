//
//  Year.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/12/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

class Year {
    private let calendar = Calendar.current

    public let name: String
    public let months: [Month]
    public let daysInYear: Int
    
    public let dayOffset: Int
    
    public var numberOfCells: Int {
        //TODO: handle edge case
        //if dayOffset == 13 && daysInYear == 366 { }
        return 378
    }
    
    init? (year: Int) {
        let components = DateComponents(calendar: calendar, year: year, month: 1, day: 1)
        guard let date = components.date else { return nil }
        guard let daysInYear = calendar.range(of: .day, in: .year, for: date)?.last else { return nil }
       
        self.name = String(year)
        self.months = []
        self.daysInYear = daysInYear
        
        self.dayOffset = {
            //TODO: clean this up 
            return (1 + (year - 2020) + Int((year - 2016) / 4)) % 14
        }()
   }
}
