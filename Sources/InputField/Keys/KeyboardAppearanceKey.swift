//
//  KeyboardAppearanceKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct KeyboardAppearanceKey: EnvironmentKey {
    static var defaultValue: UIKeyboardAppearance = .default
}

extension EnvironmentValues {

    var keyboardAppearance: UIKeyboardAppearance {
        get { self[KeyboardAppearanceKey.self] }
        set { self[KeyboardAppearanceKey.self] = newValue }
    }
}

extension View {

    public func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> some View {
        environment(\.keyboardAppearance, appearance)
    }
}
