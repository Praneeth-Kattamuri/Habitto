import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var category = "Health"
    @State private var selectedDays: [String] = []
    @State private var frequency = 1
    @State private var time = Date()
    
    let controller: HabitController

    var body: some View {
        NavigationView {
            HabitFormView(name: $name, category: $category, selectedDays: $selectedDays, frequency: $frequency, time: $time)
                .navigationTitle("New Habit")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
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
                }
        }
    }
}
