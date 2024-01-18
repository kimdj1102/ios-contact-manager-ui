//
//  AssetDecoder.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/8/24.
//

import Foundation
import UIKit

struct AssetDecoder<Element: Decodable> {
    func parse(assetName: String) throws -> Element {
        
        guard let asset = NSDataAsset(name: assetName) else { throw ContactError.assetName }
        
        guard let jsonData = try? JSONDecoder().decode(Element.self, from: asset.data) else { throw ContactError.jsonData }
        
        return jsonData
    }
}
