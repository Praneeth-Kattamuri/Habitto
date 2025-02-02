//
//  HabitController.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import Foundation

class HabitController: ObservableObject {
    @Published var habits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    func updateHabit(_ habit: Habit) {
            if let index = habits.firstIndex(where: { $0.id == habit.id }) {
                habits[index] = habit
            }
        }
}
