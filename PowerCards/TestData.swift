//
//  TestData.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import Foundation
import UIKit

struct TestData {
    static var endocrineCards: [Powercard] {
        return [
            PowerFlashCard(name: "Hypothalamus", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Hypothalamus"), shapes: [
                Shape(xCenterRelative: CGFloat(0.926470588235294), yCenterRelative: CGFloat(0.199145299145299), widthRelative: CGFloat(0.186651583710407), heightRelative: CGFloat(0.0641025641025641)),
                Shape(xCenterRelative: CGFloat(0.472850678733032), yCenterRelative: CGFloat(0.914529914529915), widthRelative: CGFloat(0.152714932126697), heightRelative: CGFloat(0.0615384615384615)),
                Shape(xCenterRelative: CGFloat(0.432126696832579), yCenterRelative: CGFloat(0.499145299145299), widthRelative: CGFloat(0.130090497737557), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.5316742081448), yCenterRelative: CGFloat(0.357264957264957), widthRelative: CGFloat(0.127828054298643), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.444570135746606), yCenterRelative: CGFloat(0.687179487179487), widthRelative: CGFloat(0.141402714932127), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.54298642533937), yCenterRelative: CGFloat(0.466666666666667), widthRelative: CGFloat(0.125565610859729), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.386877828054299), yCenterRelative: CGFloat(1.13504273504274), widthRelative: CGFloat(0.08710407239819), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.417986425339367), yCenterRelative: CGFloat(1.24273504273504), widthRelative: CGFloat(0.100113122171946), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.452488687782805), yCenterRelative: CGFloat(1.38803418803419), widthRelative: CGFloat(0.130090497737557), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.463235294117647), yCenterRelative: CGFloat(1.03247863247863), widthRelative: CGFloat(0.121606334841629), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.52884615384615), yCenterRelative: CGFloat(0.574358974358974), widthRelative: CGFloat(0.154411764705882), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.56165158371041), yCenterRelative: CGFloat(0.738461538461539), widthRelative: CGFloat(0.103506787330317), heightRelative: CGFloat(0.0683760683760684)),
                Shape(xCenterRelative: CGFloat(1.56278280542986), yCenterRelative: CGFloat(0.84957264957265), widthRelative: CGFloat(0.105769230769231), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.55599547511312), yCenterRelative: CGFloat(0.941025641025641), widthRelative: CGFloat(0.109162895927602), heightRelative: CGFloat(0.0435897435897436)),
                Shape(xCenterRelative: CGFloat(1.51809954751131), yCenterRelative: CGFloat(1.22136752136752), widthRelative: CGFloat(0.157239819004525), heightRelative: CGFloat(0.0418803418803419)),
                Shape(xCenterRelative: CGFloat(1.56674208144796), yCenterRelative: CGFloat(1.13504273504274), widthRelative: CGFloat(0.136877828054299), heightRelative: CGFloat(0.0393162393162393)),
                Shape(xCenterRelative: CGFloat(1.52545248868778), yCenterRelative: CGFloat(1.03675213675214), widthRelative: CGFloat(0.146493212669683), heightRelative: CGFloat(0.0435897435897436))
                ]),
            PowerFlashCard(name: "Pineal body", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Pineal body")),
            PowerFlashCard(name: "Digestive system", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Digestive system")),
            PowerFlashCard(name: "Kidney", subTitle: nil, image: UIImage(named: "Kidney"))
        ]
    }
    
    static var testDeckSet: Set<Powerdeck> {
        return [
//            Powerdeck(id: "1", name: "Test", creator: testUser),
//            Powerdeck(id: "2", name: "Test deck 2", creator: testUser, isShared: true),
            Powerdeck(id: UUID().uuidString, name: "Endocrine", creator: testUser, cards: endocrineCards)
        ]
    }
    
    static var testUser: User {
        return User(id: 1, name: "Peter Ivanics", email: "peter.ivanics@helsinki.fi")
    }
}
