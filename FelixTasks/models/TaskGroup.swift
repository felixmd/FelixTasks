//
//  TaskGroup.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/22/25.
//

import Foundation

struct TaskGroup: Identifiable, Hashable, Equatable {
    let id = UUID()
    var title: String
    let creationDate: Date
    var tasks: [Task]
    
    static func == (lhs: TaskGroup, rhs: TaskGroup) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        return true
    }
    
    init(title: String, tasks: [Task]=[]) {
        self.title = title
        self.tasks = tasks
        self.creationDate = Date()
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Task 1",isCompleted: false)
        let task2 = Task(title: "Task 2", isCompleted: false)
        return TaskGroup(title: "Task Group 1", tasks: [task1, task2])
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "Task Group 2")
        return [group1, group2]
    }
}
