import SwiftUI

struct HabitsView: View {
    @State private var isShowingAddHabit = false
    @ObservedObject var habitController = HabitController()

    var body: some View {
        NavigationView {
            VStack {
                if habitController.habits.isEmpty {
                    Text("No habits added yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(habitController.habits) { habit in
                                NavigationLink(destination: HabitDetailView(habit: habit, controller: habitController)) {
                                    HabitCardView(habit: habit)
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
    }
}
