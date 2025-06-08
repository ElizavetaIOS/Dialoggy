//
//  DialogBridgeModifier.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI

public struct DialogBridgeModifier: ViewModifier {
    
    @Environment(\.showDialog) var showDialog
    @Binding var presentedDialog: DialogModel?

    public func body(content: Content) -> some View {
        content
            .onChange(of: presentedDialog) { _, newValue in
                showDialog.wrappedValue = newValue
            }
    }
}

public extension View {
    
    func dialog(_ presentedDialog: Binding<DialogModel?>) -> some View {
        self.modifier(DialogBridgeModifier(presentedDialog: presentedDialog))
    }
}
