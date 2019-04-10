//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Yegor Zubarets on 3/19/19.
//  Copyright © 2019 Yegor Zubarets. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
}
