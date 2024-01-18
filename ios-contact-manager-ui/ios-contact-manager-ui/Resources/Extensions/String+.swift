//
//  String+.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피  on 1/11/24.
//

import Foundation

extension String {
    var removeBlank: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    var formmater: String {
        var stringWithhypen: String = self
        
        if stringWithhypen.prefix(4) == "+820" {
            switch stringWithhypen.count {
            case 4...6:
                print("4~6 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
            case 7...9:
                print("7~9 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: 6 - count))
            case 10...12:
                print("10~13 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 7))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: 9 - count))
            case 13...14:
                print("14~15 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("(", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 4))
                stringWithhypen.insert(")", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 6))
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 7))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 10))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: -4))
            default:
                break
            }
        }
        
        else if stringWithhypen.prefix(3) == "+82" {
            switch stringWithhypen.count {
            case 4...5:
                print("4~5 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
            case 6...8:
                print("6~9 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 6))
            case 9...11:
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 6))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: 8 - count))
            case 12...13:
                print("10~13 \(stringWithhypen.count)")
                stringWithhypen.insert(" ", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 6))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: -4))
            default:
                break
            }
        }

        else if stringWithhypen.prefix(1) != "0" || stringWithhypen.prefix(2) == "02" {
            switch stringWithhypen.count {
            case 3...5:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 2))
            case 6...8:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 2))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: 5 - count))
            case 9...10:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 2))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: -4))
            default:
                break
            }
        }
        
        else {
            switch stringWithhypen.count {
            case 4...6:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
            case 7...9:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: 6 - count))
            case 10...11:
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.startIndex, offsetBy: 3))
                stringWithhypen.insert("-", at: stringWithhypen.index(stringWithhypen.endIndex, offsetBy: -4))
            default:
                break
            }
        }
        
        return stringWithhypen
    }
}
