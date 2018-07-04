//
//  Theme.swift
//  PowerCards
//
//  Created by Peter Ivanics on 12/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

enum Theme: Int {
    case `default`
    
    var mainColor: UIColor {
        switch self {
        case .default:
            return darkBlueColor
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .default:
            return lightBlueColor
        }
    }
    
    var thirdColor: UIColor {
        switch self {
        case .default: return greenColor
        }
    }
    
    var mainBackgroundColor: UIColor {
        switch self {
        case .default:
            return darkBlueColor
        }
    }
    
    var secondaryBackgroundColor: UIColor {
        switch self {
        case .default:
            return lightBlueColor
        }
    }
    
    var headerTextColor: UIColor {
        switch self {
        case .default:
            return .white
        }
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .default:
            return .default
        }
    }
    
    // Toolbar
    var toolbarBackgroundColor: UIColor {
        switch self {
        case .default: return .white
        }
    }
    
    var toolbarBorderColor: CGColor {
        switch self {
        case .default: return UIColor.gray.cgColor
        }
    }
    
    var toolbarBorderWidth: CGFloat {
        switch self {
        case .default: return 2.0
        }
    }
    
    var toolbarCornerRadius: CGFloat {
        switch self {
        case .default: return 3.0
        }
    }
    
    var toolbarShadowOffset: CGSize {
        switch self {
        case .default: return CGSize(width: 2.0, height: 2.0)
        }
    }
    
    var toolbarShadowColor: CGColor {
        switch self {
        case .default: return UIColor.black.cgColor
        }
    }
    
    var toolbarShadowOpacity: Float {
        switch self {
        case .default: return 0.5
        }
    }
    
    var toolbarShadowRadius: CGFloat {
        switch self {
        case .default: return 5.0
        }
    }
    
    var tabbarBackgroundColor: UIColor {
        switch self {
        case .default: return thirdColor
        }
    }
    
    var tabbarTintColor: UIColor {
        switch self {
        case .default: return UIColor.white
        }
    }
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .default: return UIStatusBarStyle.lightContent
        }
    }
    
    // MARK: Private
    private var darkBlueColor: UIColor {
        return UIColor(red: 11.0/255.0, green: 50.0/255.0, blue: 103.0/255.0, alpha: 1.0)
    }
    
    private var lightBlueColor: UIColor {
        return UIColor(red: 209.0 / 255.0, green: 221.0 / 255.0, blue: 236.0 / 255, alpha: 1.0)
    }
    
    private var greenColor: UIColor {
        return UIColor(red: 149.0 / 255.0, green: 180.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
    }
}
