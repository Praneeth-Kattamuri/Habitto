import SwiftUI

struct HabitsView: View {
    @State private var isShowingAddHabit = false
    @State private var isShowingEditHabit = false
    @State private var selectedHabit: Habit? = nil
    @ObservedObject var habitController = HabitController()

    var body: some View {
        NavigationView {
            VStack {
                if habitController.habits.isEmpty {
                    Text("No habits added yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    List(habitController.habits) { habit in
                        VStack(alignment: .leading) {
                            Text(habit.name)
                                .font(.headline)
                            Text("Category: \(habit.category)")
                                .font(.subheadline)
                            
                            // Edit button
                            Button(action: {
                                selectedHabit = habit
                                isShowingEditHabit = true
                            }) {
                                Text("Edit")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddHabit = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddHabit) {
                AddHabitView(controller: habitController)
            }
            .sheet(isPresented: $isShowingEditHabit, onDismiss: {
                selectedHabit = nil
            }) {
                if let habit = selectedHabit {
                    EditHabitView(habit: habit, controller: habitController)
                }
            }
        }
    }
}
