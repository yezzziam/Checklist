//
//  TodoList.swift
//  Checklist
//
//  Created by Yegor Zubarets on 3/19/19.
//  Copyright © 2019 Yegor Zubarets. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var mediumPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    init() {
    
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        let row5Item = ChecklistItem()
        let row6Item = ChecklistItem()
        let row7Item = ChecklistItem()
        
        row0Item.text = "Disable Delete icon"
        row1Item.text = "Edit items in rows"
        row2Item.text = "Save todos in the app"
        row3Item.text = "Use Parse to save data"
        row4Item.text = "Add new checked styles"
        row5Item.text = "Add Done section"
        row6Item.text = "Remove accessory and I"
        row7Item.text = "Add dark theme"
        
        addTodo(row0Item, for: .low)
        addTodo(row1Item, for: .no)
        addTodo(row2Item, for: .high)
        addTodo(row3Item, for: .high)
        addTodo(row4Item, for: .medium)
        addTodo(row5Item, for: .low)
        addTodo(row6Item, for: .medium)
        addTodo(row7Item, for: .no)
        
    }
    
   
    func addTodo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1) {
        switch priority {
        case .high:
            if index < 0 {
                highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriorityTodos.append(item)
            } else {
                mediumPriorityTodos.insert(item, at: index)
            }
        case .low:
                if index < 0 {
                    lowPriorityTodos.append(item)
                } else {
                    lowPriorityTodos.insert(item, at: index)
            }
        case .no:
                    if index < 0 {
                        noPriorityTodos.append(item)
                    } else {
                        noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
            return highPriorityTodos
        case .medium:
            return mediumPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
    }
}
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriorityTodos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, from sourcePriority: Priority, at sourceIndex: Int, to destinationPriority: Priority, at destinationIndex: Int) {
        remove(item, from: sourcePriority, at: sourceIndex)
        addTodo(item, for: destinationPriority, at: destinationIndex)
    }
    
    func remove(_ item: ChecklistItem, from priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["New todo item", "Generic todo", "Fill mem out", "I need something to do", "Much to do about nothing"]
        let randomNumber = Int.random(in: 0 ... titles.count - 1)
        return titles[randomNumber]
    }
}
