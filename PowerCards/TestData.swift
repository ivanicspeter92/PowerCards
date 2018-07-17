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
            //            PowerFlashCard(name: "Pineal body", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Pineal body")),
            PowerFlashCard(name: "Digestive system", subTitle: "Eleifend ligula lorem turpis consectetuer, fusce integer eget ultricies inceptos.", image: UIImage(named: "Digestive system"), shapes: [
                Shape(xCenterRelative: CGFloat(0.659502262443439), yCenterRelative: CGFloat(0.518803418803419), widthRelative: CGFloat(0.085972850678733), heightRelative: CGFloat(0.0572649572649573)),
                Shape(xCenterRelative: CGFloat(1.27545248868778), yCenterRelative: CGFloat(0.54017094017094), widthRelative: CGFloat(0.162330316742081), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.36934389140271), yCenterRelative: CGFloat(0.798290598290598), widthRelative: CGFloat(0.121606334841629), heightRelative: CGFloat(0.0512820512820513)),
                Shape(xCenterRelative: CGFloat(0.554864253393665), yCenterRelative: CGFloat(1.18974358974359), widthRelative: CGFloat(0.0650452488687783), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.44626696832579), yCenterRelative: CGFloat(1.21538461538462), widthRelative: CGFloat(0.101244343891403), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.596153846153846), yCenterRelative: CGFloat(1.29059829059829), widthRelative: CGFloat(0.111990950226244), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.630656108597285), yCenterRelative: CGFloat(1.71965811965812), widthRelative: CGFloat(0.0921945701357466), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.27941176470588), yCenterRelative: CGFloat(1.81709401709402), widthRelative: CGFloat(0.0757918552036199), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.29864253393665), yCenterRelative: CGFloat(1.6991452991453), widthRelative: CGFloat(0.082579185520362), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.36142533936652), yCenterRelative: CGFloat(1.57777777777778), widthRelative: CGFloat(0.146493212669683), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.42081447963801), yCenterRelative: CGFloat(1.32649572649573), widthRelative: CGFloat(0.0893665158371041), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.38065610859729), yCenterRelative: CGFloat(1.47521367521368), widthRelative: CGFloat(0.146493212669683), heightRelative: CGFloat(0.0495726495726496))
                ]),
            PowerFlashCard(name: "Kidney", subTitle: nil, image: UIImage(named: "Kidney"), shapes: [
                Shape(xCenterRelative: CGFloat(0.419117647058824), yCenterRelative: CGFloat(0.141880341880342), widthRelative: CGFloat(0.154411764705882), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(0.43947963800905), yCenterRelative: CGFloat(1.15641025641026), widthRelative: CGFloat(0.131787330316742), heightRelative: CGFloat(0.1)),
                Shape(xCenterRelative: CGFloat(1.43608597285068), yCenterRelative: CGFloat(1.60512820512821), widthRelative: CGFloat(0.161199095022624), heightRelative: CGFloat(0.0615384615384615)),
                Shape(xCenterRelative: CGFloat(1.47171945701357), yCenterRelative: CGFloat(0.112820512820513), widthRelative: CGFloat(0.157239819004525), heightRelative: CGFloat(0.0581196581196581)),
                Shape(xCenterRelative: CGFloat(1.47398190045249), yCenterRelative: CGFloat(0.245299145299145), widthRelative: CGFloat(0.152714932126697), heightRelative: CGFloat(0.0606837606837607)),
                Shape(xCenterRelative: CGFloat(1.39366515837104), yCenterRelative: CGFloat(0.38974358974359), widthRelative: CGFloat(0.143665158371041), heightRelative: CGFloat(0.0495726495726496)),
                Shape(xCenterRelative: CGFloat(1.42647058823529), yCenterRelative: CGFloat(0.532478632478632), widthRelative: CGFloat(0.173076923076923), heightRelative: CGFloat(0.0726495726495727)),
                Shape(xCenterRelative: CGFloat(0.462669683257919), yCenterRelative: CGFloat(1.34358974358974), widthRelative: CGFloat(0.105203619909502), heightRelative: CGFloat(0.0717948717948718)),
                Shape(xCenterRelative: CGFloat(1.43495475113122), yCenterRelative: CGFloat(0.696581196581197), widthRelative: CGFloat(0.130656108597285), heightRelative: CGFloat(0.0760683760683761)),
                Shape(xCenterRelative: CGFloat(1.40441176470588), yCenterRelative: CGFloat(0.843589743589744), widthRelative: CGFloat(0.111425339366516), heightRelative: CGFloat(0.0641025641025641)),
                Shape(xCenterRelative: CGFloat(1.44570135746606), yCenterRelative: CGFloat(0.994017094017094), widthRelative: CGFloat(0.114253393665158), heightRelative: CGFloat(0.0572649572649573)),
                Shape(xCenterRelative: CGFloat(1.39309954751131), yCenterRelative: CGFloat(1.15470085470085), widthRelative: CGFloat(0.110294117647059), heightRelative: CGFloat(0.0555555555555556))
                ])
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
