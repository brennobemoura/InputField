//
//  SpellCheckingKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct SpellCheckingKey: EnvironmentKey {
    static var defaultValue: UITextSpellCheckingType = .default
}

extension EnvironmentValues {

    var spellChecking: UITextSpellCheckingType {
        get { self[SpellCheckingKey.self] }
        set { self[SpellCheckingKey.self] = newValue }
    }
}

extension View {

    public func spellChecking(_ type: UITextSpellCheckingType) -> some View {
        environment(\.spellChecking, type)
    }
}
