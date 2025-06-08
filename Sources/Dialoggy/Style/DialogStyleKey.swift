//
//  DialogStyleKey.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import Foundation
import SwiftUI

private struct DialogStyleKey: @preconcurrency EnvironmentKey {
    
    @MainActor static let defaultValue = DialogStyleConfig.defaultValue
}

extension EnvironmentValues {
    
    var dialogStyle: DialogStyleConfig {
        get { self[DialogStyleKey.self] }
        set { self[DialogStyleKey.self] = newValue }
    }
}
