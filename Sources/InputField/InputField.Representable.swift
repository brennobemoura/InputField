//
//  InputField.Representable.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

extension InputField {

    @MainActor
    struct Representable {

        @Binding var text: String
        @Binding var isEditing: Bool

        let inputMask: InputMask?

        let isEnabled: Bool
        let autocapitalizationType: UITextAutocapitalizationType
        let autocorrectionType: UITextAutocorrectionType
        let keyboardType: UIKeyboardType
        let keyboardAppearance: UIKeyboardAppearance
        let textContentType: UITextContentType?

        let secureTextEntry: Bool
        let passwordRules: [PasswordRule]

        let clearsOnBeginEditing: Bool
        let clearsOnInsertion: Bool

        let returnKey: UIReturnKeyType
        let enablesReturnKeyAutomatically: Bool

        let spellChecking: UITextSpellCheckingType

        let foregroundColor: UIColor
        let accentColor: UIColor
        let font: UIFont
    }
}

extension InputField.Representable: UIViewRepresentable {

    func makeCoordinator() -> InputField.Coordinator {
        InputField.Coordinator(self)
    }

    func makeUIView(context: Context) -> InputField.ContentView {
        let contentView = InputField.ContentView()
        contentView.delegate = context.coordinator
        return contentView
    }

    func updateUIView(_ uiView: InputField.ContentView, context: Context) {
        if uiView.input.text != text {
            uiView.input.text = text
        }

        uiView.input.inputMask = inputMask

        uiView.input.autocapitalizationType = autocapitalizationType
        uiView.input.autocorrectionType = autocorrectionType
        uiView.input.keyboardType = keyboardType
        uiView.input.keyboardAppearance = keyboardAppearance
        uiView.input.textContentType = textContentType

        uiView.input.isSecureTextEntry = secureTextEntry
        uiView.input.passwordRules = passwordRules.isEmpty ? nil : .init(rules: passwordRules)

        uiView.input.clearsOnBeginEditing = clearsOnBeginEditing
        uiView.input.clearsOnInsertion = clearsOnInsertion

        uiView.input.returnKeyType = returnKey
        uiView.input.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically

        uiView.input.spellCheckingType = spellChecking

        uiView.input.textColor = foregroundColor
        uiView.input.tintColor = accentColor
        uiView.input.font = font

        uiView.input.isEnabled = isEnabled

        // SwiftUI bug
        Task { @MainActor in
            if uiView.input.isFirstResponder != isEditing {
                if isEditing {
                    _ = uiView.input.becomeFirstResponder()
                } else {
                    _ = uiView.input.endEditing(true)
                }
            }

            if !isEnabled && isEditing {
                _ = uiView.input.endEditing(true)
                isEditing = false
            }
        }
    }
}
