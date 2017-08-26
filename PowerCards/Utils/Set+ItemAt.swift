//
//  Set+ItemAt.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

extension Set {
    func item(at index: Int) -> Element {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
