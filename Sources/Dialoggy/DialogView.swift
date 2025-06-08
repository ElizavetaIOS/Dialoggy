//
//  DialogView.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI

struct DialogView: View {
    let dialog: DialogModel
    let dismiss: () -> Void
    @Environment(\.dialogStyle) private var style

    var body: some View {
        VStack(spacing: 12) {
            if let image = dialog.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: style.imageSize.width, height: style.imageSize.height)
            }
     
            VStack(spacing: 8) {
                Text(dialog.title)
                    .font(style.titleFont)
                    .foregroundStyle(style.titleForegroundColor)
                    .multilineTextAlignment(.center)
                
                if let message = dialog.message {
                    Text(message)
                        .font(style.messageFont)
                        .foregroundStyle(style.messageForegroundColor)
                        .multilineTextAlignment(.center)
                }
                
            }
            
            VStack(spacing: 18) {
                ForEach(dialog.actions) { action in
                    DialogButton(
                        title: action.title,
                        style: action.style == .primary ? style.primaryButtonStyle : style.secondaryButtonStyle
                    ) {
                        dismiss()
                        action.completion?()
                    }
                }
            }
            .padding(.top, 16)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(24)
    }
    
    @ViewBuilder
    private func button(for action: DialogAction) -> some View {
        Button(action: {
            dismiss()
            action.completion?()
        }, label: {
            Text(action.title)
        })
        .buttonStyle(.automatic)
    }
}
