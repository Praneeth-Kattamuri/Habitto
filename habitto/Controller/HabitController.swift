import Foundation

class HabitController: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            saveHabits()
        }
    }

    init() {
        loadHabits()
    }

    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }

    func updateHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index] = habit
        }
    }
    
    func getFilteredHabitDates(habit: Habit, isFuture: Bool) -> [String] {
        let calendar = Calendar.current
        let currentDate = Date()
        var filteredDates: [String] = []
        
        // Get the habit's start date (assuming it’s set when habit is created)
        let startDate = habit.createdDate ?? currentDate
        
        // Loop through dates and filter based on the days of the week and past/future
        var dateIterator = startDate
        
        // Calculate dates depending on past or future
        let endDate = isFuture ? calendar.date(byAdding: .day, value: 21, to: currentDate)! : currentDate
        
        while dateIterator <= endDate {
            let weekday = calendar.component(.weekday, from: dateIterator)
            if habit.days.contains(getDayName(for: weekday)) {
                let dateString = formatDate(date: dateIterator)
                // If it's a future date, ensure the current date is excluded
                if isFuture && dateString != formatDate(date: currentDate) {
                    filteredDates.append(dateString)
                } else if !isFuture {
                    filteredDates.append(dateString)
                }
            }
            dateIterator = calendar.date(byAdding: .day, value: 1, to: dateIterator)!
        }
        
        return filteredDates
    }


    func getHabitDates(habit: Habit, isFuture: Bool) -> [String] {
            let calendar = Calendar.current
            let currentDate = Date()
            var filteredDates: [String] = []
            
            // Get the habit's start date (assuming it’s set when habit is created)
            let startDate = habit.createdDate ?? currentDate
            
            // Loop through dates and filter based on the days of the week and past/future
            var dateIterator = startDate
            
            // Calculate dates depending on past or future
            let endDate = isFuture ? calendar.date(byAdding: .day, value: 21, to: currentDate)! : currentDate
            
            while dateIterator <= endDate {
                let weekday = calendar.component(.weekday, from: dateIterator)
                if habit.days.contains(getDayName(for: weekday)) {
                    let dateString = formatDate(date: dateIterator)
                    filteredDates.append(dateString)
                }
                dateIterator = calendar.date(byAdding: .day, value: 1, to: dateIterator)!
            }
            
            return filteredDates
        }
    
    func getDayName(for weekday: Int) -> String {
            switch weekday {
            case 1: return "Sunday"
            case 2: return "Monday"
            case 3: return "Tuesday"
            case 4: return "Wednesday"
            case 5: return "Thursday"
            case 6: return "Friday"
            case 7: return "Saturday"
            default: return ""
            }
        }
    
    func formatDate(date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }

    private func saveHabits() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: "savedHabits")
        }
    }

    private func loadHabits() {
        if let savedData = UserDefaults.standard.data(forKey: "savedHabits"),
           let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedData) {
            habits = decodedHabits
        }
    }
}
