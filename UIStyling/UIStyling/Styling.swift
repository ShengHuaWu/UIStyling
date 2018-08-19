//
//  Styling.swift
//  UIStyling
//
//  Created by ShengHua Wu on 19.08.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

// Label
let titleLabelStyle = autolayoutStyle
    <> labelFontStyle(.systemFont(ofSize: 20, weight: .medium))
    <> labelTextColorStyle(.darkGray)

let subtitleLabelStyle = autolayoutStyle
    <> labelFontStyle(.systemFont(ofSize: 14, weight: .medium))
    <> labelTextColorStyle(.lightGray)
    <> labelTextAlignmentStyle(.center)
    <> labelNumberOfLinesStyle(0)

// Button
let actionRoundedButtonStyle = autolayoutStyle
    <> roundedStyle(6)
    <> borderStyle(.blue, 1)
    <> buttonTitleColorStyle(.blue)
    <> buttonTitleFontStyle(.systemFont(ofSize: 20, weight: .medium))

extension UIButton {
    @available(*, obsoleted: 1.0) // Expose this method ONLY for ObjC
    @objc func setActionRoundedStyle() {
        self |> actionRoundedButtonStyle
    }
}
