//
//  Error.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/8/24.
//

import Foundation

enum ContactError: LocalizedError {
    case assetName
    case jsonData
    case errorName
    case errorAge
    case errorNumber
    case systemError
    
    var errorDescription: String? {
        switch self {
        case .assetName:
            return "에셋네임을 알수 없습니다."
        case .jsonData:
            return "데이터를 알수 없습니다."
        case .errorName:
            return "입력한 이름 정보가 잘못되었습니다."
        case .errorAge:
            return "입력한 나이정보가 잘못되었습니다."
        case .errorNumber:
            return "입력한 연락처 정보가 잘못되었습니다."
        case .systemError:
            return "시스템오류"
        }
    }
}
