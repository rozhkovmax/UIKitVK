// PhotoCacheService+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для обновления элементов таблицы и коллекции
extension PhotoCacheService {
    /// Обновление ячейки в TableViewController
    class TableVC: DataReloadable {
        // MARK: - Private Properties

        private let tableVC: UITableViewController

        // MARK: - Initializator

        init(tableVC: UITableViewController) {
            self.tableVC = tableVC
        }

        // MARK: - Public Methods

        func reloadRow() {
            tableVC.tableView.reloadData()
        }
    }

    /// Обновление ячейки в CollectionViewController
    class CollectionVC: DataReloadable {
        // MARK: - Private Properties

        private let collectionVC: UICollectionViewController

        // MARK: - Initializator

        init(collectionVC: UICollectionViewController) {
            self.collectionVC = collectionVC
        }

        // MARK: - Public Methods

        func reloadRow() {
            collectionVC.collectionView.reloadData()
        }
    }

    /// Обновление ячейки в TableView
    class Table: DataReloadable {
        // MARK: - Private Properties

        private let table: UITableView

        // MARK: - Initializator

        init(table: UITableView) {
            self.table = table
        }

        // MARK: - Public Methods

        func reloadRow() {
            table.reloadData()
        }
    }
}
