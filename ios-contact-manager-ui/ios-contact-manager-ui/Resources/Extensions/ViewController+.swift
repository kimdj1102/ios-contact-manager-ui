//
//  ViewController.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/8/24.
//

import UIKit

extension UIViewController {
    func showErrorAlert(title: String?, _ message: String, actions: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        return alert
    }
}
