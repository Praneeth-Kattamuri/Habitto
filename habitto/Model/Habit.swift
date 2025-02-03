//
//  Habit.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var category: String
    var days: [String]  // Selected days (Monday, Tuesday, etc.)
    var frequency: Int
    var time: Date
    var createdDate: Date  // NEW: Track habit creation date
    
    init(name: String, category: String, days: [String], frequency: Int, time: Date, createdDate: Date = Date()) {
        self.name = name
        self.category = category
        self.days = days
        self.frequency = frequency
        self.time = time
        self.createdDate = createdDate
    }
}
