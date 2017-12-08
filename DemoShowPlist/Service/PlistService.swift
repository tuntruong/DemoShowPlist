//
//  PlistService.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/27/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class PlistService {
    func getDictFrom(plist: String) -> Dictionary<AnyHashable, Any>? {
        var result : Dictionary<AnyHashable, Any>?
        let fileNameCompomens = plist.components(separatedBy: ".")
        
        guard let filePath = Bundle.main.path(forResource: fileNameCompomens.first ?? "", ofType: fileNameCompomens.last ?? "") else {return nil}
        guard FileManager.default.fileExists(atPath: filePath) == true else { return nil}
        guard let data = FileManager.default.contents(atPath: filePath) else {return nil}
        do{
            guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<AnyHashable, Any> else {return nil}
            result = root
        }catch{
            print("")
        }
        return result
    }
}
