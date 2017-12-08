//
//  Model.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/27/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import Foundation
class City {
    var name : String
    var cityCode : Int
    
    init(name: String , cityCode : Int) {
        self.name = name
        self.cityCode = cityCode
    }
    convenience init? (dictionary: Dictionary<String,Any>) {
        guard let name = dictionary["Name"] as? String , let cityCode = dictionary["CityCode"] as? Int  else {return nil}
        self.init(name: name , cityCode : cityCode)
    }
    
}

class District {
    var name : String
    var districtCode : Int
    var cityCode : Int
    
    init(name : String , districtCode: Int , cityCode: Int){
        self.name = name
        self.districtCode = districtCode
        self.cityCode = cityCode
    }
    convenience init? (dictionary: Dictionary<String,Any>){
        guard let name = dictionary["Name"] as? String else {return nil}
        guard let districtCode = dictionary["DistrictCode"] as? Int else {return nil}
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        self.init(name: name , districtCode: districtCode , cityCode: cityCode)
    }
}

