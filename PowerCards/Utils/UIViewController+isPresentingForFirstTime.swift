//
//  UIViewController+isPresentingForFirstTime.swift
//  Powercards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit

extension UIViewController {
    var isPresentingForFirstTime: Bool {
        return isBeingPresented || isMovingToParentViewController
    }
}
