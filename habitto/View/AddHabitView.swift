//
//  AddHabitView.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var category = "Health"
    @State private var selectedDays: [String] = []
    @State private var frequency = 1
    @State private var time = Date()
    
    let categories = ["Health", "Work", "Personal Growth", "Hobbies", "Other"]
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var controller: HabitController

    var body: some View {
        NavigationView {
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

                Button("Save Habit") {
                    let newHabit = Habit(name: name, category: category, days: selectedDays, frequency: frequency, time: time)
                    controller.addHabit(newHabit)
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .navigationTitle("New Habit")
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
