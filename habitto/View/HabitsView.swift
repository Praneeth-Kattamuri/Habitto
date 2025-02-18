import SwiftUI

struct HabitsView: View {
    @State private var isShowingAddHabit = false
    @ObservedObject var habitController = HabitController()

    // Store fetched habits in a state to simplify the view body
    @State private var fetchedHabits: [Habit] = []

    var body: some View {
        NavigationView {
            VStack {
                if fetchedHabits.isEmpty {
                    Text("No habits added yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            // Iterate over the habits
                            ForEach(fetchedHabits) { habit in
                                NavigationLink(destination: HabitDetailView(habit: habit, controller: habitController)) {
                                    // Use the category of the habit to decide which card to show
                                    if habit.category == "Health" {
                                        HealthHabitCard(habit: habit)
                                    } else if habit.category == "Work" {
                                        WorkHabitCard(habit: habit)
                                    } else if habit.category == "Personal Growth" {
                                        PersonalGrowthHabitCard(habit: habit)
                                    } else if habit.category == "Hobbies" {
                                        HobbiesHabitCard(habit: habit)
                                    } else {
                                        OtherHabitCard(habit: habit)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes default link styling
                            }
                        }
                        .padding()
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
        }
        .onAppear {
            // Fetch the habits when the view appears
            fetchedHabits = habitController.fetchHabits()
        }
    }
}
