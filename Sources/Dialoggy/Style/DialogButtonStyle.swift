//
//  DialogButtonStyle.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI

public struct DialogButtonStyle {

    let backgroundColor: Color
    let borderColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let font: Font
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    
    public init(
        backgroundColor: Color,
        foregroundColor: Color,
        borderColor: Color = .clear,
        cornerRadius: CGFloat,
        font: Font,
        horizontalPadding: CGFloat,
        verticalPadding: CGFloat
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    

    nonisolated(unsafe) public static let primary = DialogButtonStyle(
        backgroundColor: Color.accentColor,
        foregroundColor: Color.white,
        cornerRadius: 12,
        font: .headline,
        horizontalPadding: 16,
        verticalPadding: 10
    )

    nonisolated(unsafe) public static let secondary = DialogButtonStyle(
        backgroundColor: Color.clear,
        foregroundColor: Color.accentColor,
        cornerRadius: 12,
        font: .subheadline,
        horizontalPadding: 16,
        verticalPadding: 10
    )
}
