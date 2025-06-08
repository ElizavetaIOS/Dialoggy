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
        VStack(spacing: 16) {
            dialog.image?
                .resizable()
                .scaledToFit()
                .frame(width: style.imageSize.width, height: style.imageSize.height)

            Text(dialog.title)
                .font(style.messageFont)
                .foregroundStyle(style.messageForegroundColor)
                .multilineTextAlignment(.center)
            
            if let message = dialog.message {
                Text(message)
                    .font(style.messageFont)
                    .foregroundStyle(style.messageForegroundColor)
                    .multilineTextAlignment(.center)
            }
            
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
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
    
    @ViewBuilder
    private func button(for action: DialogAction) -> some View {
        //let style = style.buttonStyleProvider.style(for: action.style)
        Button(action: {
            dismiss()
            action.completion?()
        }, label: {
            Text(action.title)
        })
        .buttonStyle(.automatic)
    }
}
