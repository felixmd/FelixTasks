//
//  SideBarView.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/24/25.
//

import SwiftUI

struct SideBarView: View {

    
    let userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection){
            Section("Favorites"){
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName!)
                        .tag(selection)
                }
            }
        
            Section("Your Groups"){
                ForEach(userCreatedGroups) { group in
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
            
        }
    }
}

#Preview {
    SideBarView(userCreatedGroups: TaskGroup.examples(), selection: .constant(.all)).listStyle(.sidebar)
    
}
