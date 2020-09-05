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

    var dataDictionary:[String:Any] = [:]
    
    func loadJson() {
        guard let fileUrl = Bundle.main.url(forResource: "Data", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: fileUrl)

            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }

            dataDictionary = dictionary
        } catch { }
    }
    
    func log(day: Day) {}
    func getData(for key: DateKey) {}
    private func lookupDate() {}
    func createYearModel() {}
    func createMonthModel() {}
    func getYearSummary() {}
    func getMonthSummary() {}
}


