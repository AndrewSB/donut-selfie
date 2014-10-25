//
//  PCEditDonutButtonView.swift
//  donut-selfie
//
//  Created by Arjun Sarode on 10/25/14.
//  Copyright (c) 2014 sprinkles. All rights reserved.
//

import UIKit

class PCEditDonutButtonView: UIButton {

    override func drawRect(rect: CGRect) {
        DonutStyleKit.drawContinueButton(8)
    }

}
