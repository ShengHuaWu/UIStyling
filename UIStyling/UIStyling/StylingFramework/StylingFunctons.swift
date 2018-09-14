//
//  StylingFunctons.swift
//  UIStyling
//
//  Created by ShengHua Wu on 19.08.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

// Operators
precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication

public func |> <A, B>(_ a: A, _ f: @escaping (A) -> B) -> B {
    return f(a)
}

precedencegroup SingleComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator <>: SingleComposition

public func <> <A: AnyObject>(_ f: @escaping (A) -> Void, _ g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

// Autolayout
public func autolayoutStyle(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
}

// View
public func roundedStyle(_ radius: CGFloat) -> (UIView) -> Void {
    return {
        $0.layer.cornerRadius = radius
    }
}

public func borderStyle(_ color: UIColor, _ width: CGFloat) -> (UIView) -> Void {
    return {
        $0.layer.borderColor = color.cgColor
        $0.layer.borderWidth = width
    }
}

// Label
public func labelFontStyle(_ font: UIFont) -> (UILabel) -> Void {
    return {
        $0.font = font
    }
}

public func labelTextColorStyle(_ color: UIColor) -> (UILabel) -> Void {
    return {
        $0.textColor = color
    }
}

public func labelTextAlignmentStyle(_ alignment: NSTextAlignment) -> (UILabel) -> Void {
    return {
        $0.textAlignment = alignment
    }
}

public func labelNumberOfLinesStyle(_ numberOfLines: Int) -> (UILabel) -> Void {
    return {
        $0.numberOfLines = numberOfLines
    }
}

// Button
public func buttonTitleColorStyle(_ color: UIColor) -> (UIButton) -> Void {
    return {
        $0.setTitleColor(color, for: .normal)
    }
}

public func buttonTitleFontStyle(_ font: UIFont) -> (UIButton) -> Void {
    return {
        $0.titleLabel?.font = font
    }
}
