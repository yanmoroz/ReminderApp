//
//  ReminderListViewController+Actions.swift
//  ReminderApp
//
//  Created by Yan Moroz on 13.02.2024.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
