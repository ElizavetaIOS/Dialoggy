//
//  DialogStyleConfig.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import Foundation
import SwiftUI

@MainActor
public struct DialogStyleConfig : Sendable{

    let primaryButtonStyle: DialogButtonStyle
    let secondaryButtonStyle: DialogButtonStyle
    let titleFont: Font
    let titleForegroundColor: Color
    let messageFont: Font
    let messageForegroundColor: Color
    let imageSize: CGSize
    
    public init(
        primaryButtonStyle: DialogButtonStyle,
        secondaryButtonStyle: DialogButtonStyle,
        titleFont: Font,
        titleForegroundColor: Color,
        messageFont: Font,
        messageForegroundColor: Color,
        imageSize: CGSize
    ) {
        self.primaryButtonStyle = primaryButtonStyle
        self.secondaryButtonStyle = secondaryButtonStyle
        self.titleFont = titleFont
        self.titleForegroundColor = titleForegroundColor
        self.messageFont = messageFont
        self.messageForegroundColor = messageForegroundColor
        self.imageSize = imageSize
    }
    
}

public extension DialogStyleConfig {
    
    static let defaultValue = DialogStyleConfig(
        primaryButtonStyle: DialogButtonStyle.primary,
        secondaryButtonStyle: DialogButtonStyle.secondary,
        titleFont: .title2.bold(),
        titleForegroundColor: .primary,
        messageFont: .body,
        messageForegroundColor: .secondary,
        imageSize: CGSize(width: 72, height: 72)
    )
    
}
