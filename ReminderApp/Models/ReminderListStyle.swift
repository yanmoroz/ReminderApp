//
//  ReminderListStyle.swift
//  ReminderApp
//
//  Created by Yan Moroz on 14.02.2024.
//

import Foundation

enum ReminderListStyle: Int, CaseIterable {
    case today
    case future
    case all
    
    var name: String {
        switch self {
        case .today:
            return NSLocalizedString("Today", comment: "Today style name")
        case .future:
            return NSLocalizedString("Future", comment: "Future style name")
        case .all:
            return NSLocalizedString("All", comment: "All style name")
        }
    }
    
    func shouldInclude(date: Date) -> Bool {
        let isToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isToday
        case .future:
            return (date > .now) && !isToday
        case .all:
            return true
        }
    }
}
