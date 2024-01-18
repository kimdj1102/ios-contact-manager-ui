//
//  ViewController.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/2/24.
//

import UIKit

final class ContactViewController: UIViewController {
    
    private let tableView: UITableView = {
      let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        parse()
        configure()
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)])
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    
    private func parse() {
        do {
            contacts = try AssetDecoder<[Contact]>().parse(assetName: "MOCK_DATA")
        } catch {
             showErrorAlert(error)
            
        }
    }
}

// MARK: - UITableViewDataSource

extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier , for: indexPath)
        let item = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = item.nameAndAge
        content.secondaryText = item.phoneNumber
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
