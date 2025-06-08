//
//  Untitled.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI

public struct ShowDialogKey: @preconcurrency EnvironmentKey {
    
    @MainActor
    public static let defaultValue: Binding<DialogModel?> = .constant(nil)
}

extension EnvironmentValues {
    
    var showDialog: Binding<DialogModel?> {
        get { self[ShowDialogKey.self] }
        set { self[ShowDialogKey.self] = newValue }
    }
}
