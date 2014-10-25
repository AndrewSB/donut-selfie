//
//  PCAddButtonView.swift
//  donut-selfie
//
//  Created by Arjun Sarode on 10/24/14.
//  Copyright (c) 2014 sprinkles. All rights reserved.
//

import UIKit

class PCAddButtonView: UIButton {


    override func drawRect(rect: CGRect) {
        DonutStyleKit.drawAddButton(8)
    }


}
