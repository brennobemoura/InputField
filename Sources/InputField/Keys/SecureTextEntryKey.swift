//
//  SecureTextEntryKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct SecureTextEntryKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {

    var secureTextEntry: Bool {
        get { self[SecureTextEntryKey.self] }
        set { self[SecureTextEntryKey.self] = newValue }
    }
}

extension View {

    public func secureTextEntry(_ isSecureTextEntry: Bool) -> some View {
        environment(\.secureTextEntry, isSecureTextEntry)
    }
}
