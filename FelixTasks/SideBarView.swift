//
//  SideBarView.swift
//  FelixTasks
//
//  Created by Felix Devasia on 7/24/25.
//

import SwiftUI

struct SideBarView: View {

    
    @Binding var userCreatedGroups: [TaskGroup]
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
                ForEach($userCreatedGroups) { $group in
                    
                    HStack{
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }.tag(TaskSection.list(group))
                }
            }
            
        }
        .safeAreaInset(edge: .bottom, content: {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        })
    }
}

#Preview("Default") {
    SideBarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all)).listStyle(.sidebar)
    
}

#Preview("Empty") {
    SideBarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all)).listStyle(.bordered)
    
}
