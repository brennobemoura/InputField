//
//  InputField.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

@MainActor
struct InputField: View {

    @State var isEditing: Bool = false

    @Environment(\.editing) var editing
    @Environment(\.autocapitalization) var autocapitalization
    @Environment(\.disableAutocorrection) var disableAutocorrection
    @Environment(\.keyboard) var keyboard
    @Environment(\.keyboardAppearance) var keyboardAppearance
    @Environment(\.textContent) var textContent
    @Environment(\.secureTextEntry) var secureTextEntry
    @Environment(\.passwordRules) var passwordRules
    @Environment(\.clearsOnBeginEditing) var clearsOnBeginEditing
    @Environment(\.clearsOnInsertion) var clearsOnInsertion
    @Environment(\.returnKey) var returnKey
    @Environment(\.enablesReturnKeyAutomatically) var enablesReturnKeyAutomatically
    @Environment(\.spellChecking) var spellChecking
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.inputMask) var inputMask

    @Binding var text: String

    private let foregroundColor: UIColor
    private let accentColor: UIColor
    private let font: UIFont

    init(
        text: Binding<String>,
        foregroundColor: UIColor,
        accentColor: UIColor,
        font: UIFont
    ) {
        self._text = text
        self.foregroundColor = foregroundColor
        self.accentColor = accentColor
        self.font = font
    }

    var body: some View {
        Representable(
            text: $text,
            isEditing: $isEditing,
            inputMask: inputMask,
            isEnabled: isEnabled,
            autocapitalizationType: autocapitalization,
            autocorrectionType: disableAutocorrection.map { $0 ? .no : .yes } ?? .default,
            keyboardType: keyboard,
            keyboardAppearance: keyboardAppearance,
            textContentType: textContent,
            secureTextEntry: secureTextEntry,
            passwordRules: passwordRules,
            clearsOnBeginEditing: clearsOnBeginEditing,
            clearsOnInsertion: clearsOnInsertion,
            returnKey: returnKey,
            enablesReturnKeyAutomatically: enablesReturnKeyAutomatically,
            spellChecking: spellChecking,
            foregroundColor: foregroundColor,
            accentColor: accentColor,
            font: font
        )
        .onChange(of: editing.0) {
            if isEditing != $0 {
                isEditing = $0
            }
        }
    }
}

struct InputField_Previews: PreviewProvider {

    static var previews: some View {
        InputField(
            text: .constant("012"),
            foregroundColor: .red,
            accentColor: .blue,
            font: .systemFont(ofSize: 16)
        )
        .padding()
    }
}
