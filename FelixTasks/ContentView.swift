//
//  ContentView.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var selection = TaskSection.all
    @State private var allTasks: [Task] = Task.examples()
    
    var body: some View {
        NavigationSplitView {
            SideBarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
            
        }detail: {
            switch selection {
            case .all:
                TaskListView(title: "All Tasks", tasks: allTasks)
            case .upcoming:
                TaskListView(title: "Upcoming Tasks", tasks: allTasks.filter({
                    !$0.isCompleted
                }))
            case .done:
                TaskListView(title: "Done Tasks", tasks: allTasks.filter({
                    $0.isCompleted
                }))
            case .list(let group):
                        TaskListView(title: group.title, tasks: group.tasks)
            }
                
        }
        
    }
}

#Preview {
    ContentView()
}
