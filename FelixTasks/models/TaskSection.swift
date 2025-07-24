//
//  TaskSection.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/22/25.
//

import Foundation


enum TaskSection: Identifiable, CaseIterable, Hashable {
    case all
    case done
    case upcoming
    case list(TaskGroup)
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String {
        switch self {
        case .all:
            return "all"
            case .done:
            return "done"
        case .upcoming:
            return "upcoming"
        case .list(let group):
            return group.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all:
            return "All"
        case .done:
            return "Done"
        case .upcoming:
            return "Upcoming"
        case .list(let group):
            return group.title
        }
    }
    
    var iconName: String? {
        switch self {
        case .all:
            return "list.bullet"
        case .done:
            return "checkmark"
        case .upcoming:
            return "clock"
        case .list:
            return "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    

}
