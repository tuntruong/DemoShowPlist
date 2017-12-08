//
//  DataService.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/27/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//
import Foundation
class DataService{
    static let shared = DataService()
    private var _cities: [City]?
    
    var cities: [City]{
        get {
            if _cities == nil {
                loadCity()
            }
            return _cities!
        }
        set{
            _cities = newValue
        }
    }
    
    private var _districts: [District]?
    
    var districts: [District]{
        get {
            if _districts == nil {
                loadDistrict()
            }
            return _districts!
        }
        set{
            _districts = newValue
        }
    }
    
    var selectedCity : City?{
        didSet{
            if selectedCity != nil {
                districtsAtSelectedCity = districts.filter{$0.cityCode == selectedCity?.cityCode}
            }
        }
    }

    var districtsAtSelectedCity: [District]?
    
    //Load Array From Dictionary
    func loadCity(){
        guard let dictionary = PlistService().getDictFrom(plist: "Cities.plist") else {return}
        guard let cityDicts = dictionary["Cities"] as? [Dictionary<String, Any>] else {return}
        
        _cities = []
        for cityDict in cityDicts {
            let city = City(dictionary: cityDict)
            _cities?.append(city!)
        }
    }
    
    func loadDistrict(){
        guard let dictionary = PlistService().getDictFrom(plist: "Districts.plist") else {return}
        guard let disDicts = dictionary["Districts"] as? [Dictionary<String, Any>] else {return}
        
        _districts = []
        for disDict in disDicts {
            let dis = District(dictionary: disDict)
            _districts?.append(dis!)
        }
    }
}
