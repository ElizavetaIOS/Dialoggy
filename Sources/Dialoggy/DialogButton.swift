//
//  DialogButton.swift
//  FlowKit
//
//  Created by Elizaveta Shcherbakova on 8/6/25.
//

import SwiftUI

struct DialogButton: View {
    let title: LocalizedStringKey
    let style: DialogButtonStyle
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(style.font)
                .foregroundColor(style.foregroundColor)
                .padding(.horizontal, style.horizontalPadding)
                .padding(.vertical, style.verticalPadding)
                .frame(maxWidth: .infinity)
                .background(style.backgroundColor)
                .cornerRadius(style.cornerRadius)
                .overlay{
                    RoundedRectangle(cornerRadius: style.cornerRadius)
                        .stroke(style.borderColor)
                }
        }
    }
}
