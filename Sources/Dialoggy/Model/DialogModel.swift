//
//  DialogModel.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import Foundation
import SwiftUI

public struct DialogModel: Identifiable, Equatable {
    public let id: String
    let image: Image?
    let title: LocalizedStringKey
    let message: LocalizedStringKey?
    let actions: [DialogAction]
    
    public init(
        resource: ImageResource?,
        title: LocalizedStringKey,
        message: LocalizedStringKey? = nil,
        actions: [DialogAction]
    ) {
        self.id = UUID().uuidString
        self.image = resource.map { Image($0) }
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    public init(image: Image?, title: LocalizedStringKey, message: LocalizedStringKey? = nil, actions: [DialogAction]) {
        self.id = UUID().uuidString
        self.image = image
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    public static func == (lhs: DialogModel, rhs: DialogModel) -> Bool {
        return lhs.id == rhs.id
    }
}
