//
//  ViewController.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/8/24.
//

import UIKit

extension UIViewController {
    func showErrorAlert(_ error: Error) {
        let alertTitle: String = "오류"
        var message: String {
            switch error {
            case DecoderError.assetName:
                return "에셋네임을 알수 없습니다."
            case DecoderError.jsonData:
                return "데이터를 알수 없습니다."
            default:
                return "시스템오류가 발생했습니다."
            }
        }
        
        let cancelTiltle: String = "취소"
        let retryTitle: String = "재시도"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelTiltle, style: .default)
        let retryAction = UIAlertAction(title: retryTitle, style: .default)
        
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}
