//
//  DialogAction.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import Foundation
import SwiftUI

public  struct DialogAction: Identifiable {
    public let id: String
    let title: LocalizedStringKey
    let style: DialogActionStyle
    let completion: (() -> Void)?
    
    public init(title: LocalizedStringKey, style: DialogActionStyle, completion: (() -> Void)?) {
        self.id = UUID().uuidString
        self.title = title
        self.style = style
        self.completion = completion
    }
}
