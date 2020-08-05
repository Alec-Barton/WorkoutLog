//
//  Day.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class Day {
    var date: Date
    var key: DateKey
    var workouts: [Workout] = []
    
    init (date: Date) {
        self.date = date
        self.key = DateKey(year: date.year, day: date.dayOfYear)
    }
}
