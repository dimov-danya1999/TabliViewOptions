//
//  HomeViewController.swift
//  Barbershop
//
//  Created by mac on 20.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var refreshControl = UIRefreshControl()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.indetificator)
        return tableView
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        settingTableView()
        setup()
        configure()
    }
    
    private func settingTableView() {
        let title = UILabel()
        title.text = "Настройки"
        title.font = UIFont.boldSystemFont(ofSize: 50)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        self.tableView.refreshControl?.endRefreshing()
    }
    
    func configure() {
        models.append(Section(title: "Главные настройки", options: [
            SettingOptions(title: "Настройки", icon: UIImage(systemName: "person"), iconBackground: .systemRed),
            SettingOptions(title: "Wi-fi", icon: UIImage(systemName: "person"), iconBackground: .systemRed)
        ]))
    
        models.append(Section(title: "Оповещения", options: [
            SettingOptions(title: "Уведомления", icon: UIImage(systemName: "house"), iconBackground: .blue),
            SettingOptions(title: "Звука", icon: UIImage(systemName: "house"), iconBackground: .blue)
        ]))
    }
    
    private func setup() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
            URLCache.shared.removeAllCachedResponses()
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.indetificator, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].options[indexPath.row]
    }
}
