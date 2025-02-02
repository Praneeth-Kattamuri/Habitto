import SwiftUI

struct EditHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String
    @State private var category: String
    @State private var selectedDays: [String]
    @State private var frequency: Int
    @State private var time: Date
    
    var habit: Habit
    var controller: HabitController

    // Initializer to pass the selected habit's details
    init(habit: Habit, controller: HabitController) {
        _name = State(initialValue: habit.name)
        _category = State(initialValue: habit.category)
        _selectedDays = State(initialValue: habit.days)
        _frequency = State(initialValue: habit.frequency)
        _time = State(initialValue: habit.time)
        self.habit = habit
        self.controller = controller
    }

    var body: some View {
        NavigationView {
            HabitFormView(name: $name, category: $category, selectedDays: $selectedDays, frequency: $frequency, time: $time)
                .navigationTitle("Edit Habit")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save Habit") {
                            var updatedHabit = habit
                            updatedHabit.name = name
                            updatedHabit.category = category
                            updatedHabit.days = selectedDays
                            updatedHabit.frequency = frequency
                            updatedHabit.time = time
                            
                            controller.updateHabit(updatedHabit)
                            dismiss()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
        }
    }
}
