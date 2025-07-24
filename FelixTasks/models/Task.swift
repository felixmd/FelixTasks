//
//  Task.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/21/25.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var details: String?
    
    init(title: String, isCompleted: Bool, dueDate: Date? = nil, details: String? = nil) {
        
        self.title = title
        self.isCompleted = isCompleted
    }
    
    static func example() -> Task {
        .init(title: "Example Task", isCompleted: false, dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Buy Groceries", isCompleted: true),
            Task(title: "Create App", isCompleted: false),
            Task(title: "Language Classes", isCompleted: false, details: "Study some German !!")
            
        ]
    }
}
