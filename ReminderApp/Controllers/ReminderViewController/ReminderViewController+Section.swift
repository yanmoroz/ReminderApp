//
//  ReminderViewController+Section.swift
//  ReminderApp
//
//  Created by Yan Moroz on 13.02.2024.
//

import Foundation

extension ReminderViewController {
    enum Section: Int {
        case view
        case title
        case date
        case notes
        
        var name: String {
            switch self {
            case .view:
                return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
