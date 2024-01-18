//
//  DetailView.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/11/24.
//

import UIKit

final class DetailView: UIView {
    
    var contact: Contact? {
        didSet {
            guard let contact = contact else { return }
            nameTextField.text = contact.name
            ageTextField.text = contact.age
            phoneNumberTextField.text = contact.phoneNumber
        }
    }
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "이름"
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.font = UIFont.preferredFont(forTextStyle: .callout)
        textField.frame.size.height = 15
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.adjustsFontForContentSizeCategory = true
        textField.adjustsFontSizeToFitWidth = true
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "나이"
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.preferredFont(forTextStyle: .callout)
        tf.frame.size.height = 20
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.adjustsFontSizeToFitWidth = true
        tf.adjustsFontForContentSizeCategory = true
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var ageStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "전화번호"
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.preferredFont(forTextStyle: .callout)
        tf.frame.size.height = 20
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.adjustsFontSizeToFitWidth = true
        tf.adjustsFontForContentSizeCategory = true
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var phoneNumberStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nameStackView, ageStackView, phoneNumberStackView])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupKeyboardType()
        setupStackView()
        phoneNumberTextField.addTarget(self, action: #selector(edit), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupKeyboardType() {
        nameTextField.keyboardType = .default
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
    }
    
    private func setupStackView() {
        self.addSubview(stackView)
    }
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
            ageLabel.widthAnchor.constraint(equalToConstant: 70),
            phoneNumberLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}

extension DetailView {
    @objc func edit() {
        guard let edit = phoneNumberTextField.text?.replacingOccurrences(of: "-", with: "") else {
            return
        }
        
        var text = edit.replacingOccurrences(of: " ", with: "")
        text = text.replacingOccurrences(of: "(", with: "")
        text = text.replacingOccurrences(of: ")", with: "")

        phoneNumberTextField.text = text.formmater
    }
}
