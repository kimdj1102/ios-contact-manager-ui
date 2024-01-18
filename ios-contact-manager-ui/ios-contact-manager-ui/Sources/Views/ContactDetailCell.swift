//
//  CustomCell.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/5/24.
//

import UIKit

final class ContactDetailCell: UITableViewCell {
    
    var contact: Contact? {
        didSet {
            guard let contact = contact else { return }
            contactNameLabel.text = "   이름 : \(contact.name)"
            contactAgeLabel.text = "   나이 : \(contact.age)"
            contactPhoneNumberLabel.text = "연락처 : \(contact.phoneNumber)"
            
            contactNameLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
            contactAgeLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
            contactPhoneNumberLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
            contactNameLabel.adjustsFontForContentSizeCategory = true
            contactAgeLabel.adjustsFontForContentSizeCategory = true
            contactPhoneNumberLabel.adjustsFontForContentSizeCategory = true
        }
    }
    
    let contactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contactAgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contactPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0.2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setConstraint()
        accessoryType = .disclosureIndicator
    }
    
    func setupStackView() {
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(contactNameLabel)
        stackView.addArrangedSubview(contactAgeLabel)
        stackView.addArrangedSubview(contactPhoneNumberLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            contactNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            contactAgeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            contactPhoneNumberLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            contactNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -20),
            contactAgeLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -20),
            contactPhoneNumberLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

