//
//  ReminderViewController.swift
//  ReminderApp
//
//  Created by Yan Moroz on 13.02.2024.
//

import UIKit

class ReminderViewController: UICollectionViewController {
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>
    private typealias Snapshop = NSDiffableDataSourceSnapshot<Int, Row>
    
    var reminder: Reminder
    private var dataSource: DataSource!
    
    init(reminder: Reminder) {
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(collectionView: collectionView, cellProvider: {
            $0.dequeueConfiguredReusableCell(using: cellRegistration, for: $1, item: $2)
        })
        navigationItem.style = .navigator
        navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
        
        updateSnapshot()
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = text(for: row)
        contentConfiguration.textProperties.font = .preferredFont(forTextStyle: row.textStyle)
        contentConfiguration.image = row.image
        cell.contentConfiguration = contentConfiguration
        cell.tintColor = .todayPrimaryTint
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .date:
            return reminder.dueDate.dayText
        case .notes:
            return reminder.notes
        case .time:
            return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .title:
            return reminder.title
        }
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshop()
        snapshot.appendSections([0])
        snapshot.appendItems(Row.allCases, toSection: 0)
        dataSource.apply(snapshot)
    }
}
