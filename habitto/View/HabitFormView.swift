//
//  HabitFormView.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import SwiftUI

struct HabitFormView: View {
    @Binding var name: String
    @Binding var category: String
    @Binding var selectedDays: [String]
    @Binding var frequency: Int
    @Binding var time: Date
    
    let categories = ["Health", "Work", "Personal Growth", "Hobbies", "Other"]
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        Form {
            Section(header: Text("Habit Details")) {
                TextField("Habit Name", text: $name)

                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }

                Picker("Frequency per day", selection: $frequency) {
                    ForEach(1...10, id: \.self) { num in
                        Text("\(num) times")
                    }
                }

                DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
            }

            Section(header: Text("Days")) {
                ForEach(daysOfWeek, id: \.self) { day in
                    MultipleSelectionRow(title: day, isSelected: selectedDays.contains(day)) {
                        if selectedDays.contains(day) {
                            selectedDays.removeAll { $0 == day }
                        } else {
                            selectedDays.append(day)
                        }
                    }
                }
            }
        }
    }
}
