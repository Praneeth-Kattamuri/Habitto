//
//  HabitsView.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//
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
                    List(habitController.habits) { habit in
                        VStack(alignment: .leading) {
                            Text(habit.name)
                                .font(.headline)
                            Text("Category: \(habit.category)")
                                .font(.subheadline)
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
        }
    }
}
