//
//  Day.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

class Day {
    var date: Date
    var workouts: [Workout] = []
    
    init (date: Date) {
        self.date = date
    }
}
