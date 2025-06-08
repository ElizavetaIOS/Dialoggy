//
//  DialogableViewModifier.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI
import Foundation

public extension View {
    
    func dialogable(style: DialogStyleConfig = .defaultValue) -> some View {
        self.environment(\.dialogStyle, style)
            .modifier(DialogableViewModifier())
    }
}

struct DialogableViewModifier: ViewModifier {
    @State private var currentDialog: DialogModel?
    @Environment(\.dialogStyle) private var style

    func body(content: Content) -> some View {
        ZStack {
            content
                .environment(\.showDialog, $currentDialog)

            if let dialog = currentDialog {
                DialogView(dialog: dialog, dismiss: { currentDialog = nil })
                    .transition(.opacity)
                    .zIndex(1000)
            }
        }
    }
}
