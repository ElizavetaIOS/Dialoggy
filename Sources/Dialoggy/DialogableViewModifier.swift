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
        self.modifier(DialogableViewModifier())
            .environment(\.dialogStyle, style)
    }
}

struct DialogableViewModifier: ViewModifier {
    @State private var currentDialog: DialogModel?
    @Environment(\.dialogStyle) private var style
    
    var isPresented: Bool {
        return currentDialog != nil
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .environment(\.showDialog, $currentDialog)
            
            ZStack {
                Color.black
                .ignoresSafeArea()
                .opacity(currentDialog == nil ? .zero : 0.4)

                if let currentDialog {
                    DialogView(dialog: currentDialog, dismiss: { self.currentDialog = nil })
                        .transition(.asymmetric(insertion: .push(from: .bottom), removal: .opacity))
                        .onAppear {
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        }
                        .zIndex(1000)
                        .padding(.horizontal, 40)
                }
            }
            .ignoresSafeArea()
            .animation(.easeInOut, value: isPresented)
        }
    }
}
