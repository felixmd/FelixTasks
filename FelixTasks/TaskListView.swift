//
//  TaskListView.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/24/25.
//

import SwiftUI

struct TaskListView: View {

    let title: String
    let tasks: [Task]
    
    var body: some View {
        
            
            
            List(tasks) { task in
                HStack {
                    
                    Image(systemName: task.isCompleted ?  "circle.fill" : "circle")
                    Text(task.title)
                }
            }
        
        
        
    }
}

#Preview {

    TaskListView(title: "All Tasks", tasks: Task.examples())
}
