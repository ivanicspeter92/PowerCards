//
//  AppSettings.swift
//  PowerCards
//
//  Created by Peter Ivanics on 25/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

public class AppSettings {
    private static let settingsPlistFileName = "Settings"
    private static var settingsDicionary: [String: Any] = {
        let path = Bundle.main.path(forResource: settingsPlistFileName, ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: path) as! [String: Any]
        
        return dictionary
    }()
    
    static var isProductionVersion: Bool {
        if let value = settingsDicionary[AppSettingKeys.isProductionVersion.rawValue] as? Bool {
            return value
        }
        return false
    }
    
    static var isDebugVersion: Bool {
        return !isProductionVersion
    }
    
    static var serverAddress: String {
        if isProductionVersion {
            return settingsDicionary[AppSettingKeys.productionServerAddress.rawValue] as! String
        } else {
            return settingsDicionary[AppSettingKeys.testServerAddress.rawValue] as! String
        }
    }
    
    static var serverPort: String {
        if isProductionVersion {
            return settingsDicionary[AppSettingKeys.productionServerPort.rawValue] as! String
        } else {
            return settingsDicionary[AppSettingKeys.testServerPort.rawValue] as! String
        }
    }
    
    static var hostname: String {
        return AppSettings.´protocol´ + "://" + AppSettings.serverAddress + ":" + AppSettings.serverPort
    }
    
    static var ´protocol´: String {
        return "http"
    }
    
    public static var powerFlashCardColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "PaperColor", in: Bundle(for: PowerFlashCard.self), compatibleWith: nil) ?? UIColor.white
        } else {
            return UIColor.white
        }
    }
}
