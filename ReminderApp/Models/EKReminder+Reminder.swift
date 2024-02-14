//
//  EKReminder+Reminder.swift
//  ReminderApp
//
//  Created by Yan Moroz on 14.02.2024.
//

import EventKit

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach({ alarm in
            guard let absoluteDate = alarm.absoluteDate else { return }
            let comparison = Locale.current.calendar.compare(reminder.dueDate,
                                                             to: absoluteDate,
                                                             toGranularity: .minute)
            if comparison != .orderedSame {
                removeAlarm(alarm)
            }
        })
        
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
