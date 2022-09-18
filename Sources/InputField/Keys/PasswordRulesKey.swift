//
//  PasswordRulesKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct PasswordRulesKey: EnvironmentKey {
    static var defaultValue: [PasswordRule] = []
}

extension EnvironmentValues {

    var passwordRules: [PasswordRule] {
        get { self[PasswordRulesKey.self] }
        set { self[PasswordRulesKey.self] = newValue }
    }
}

extension View {

    public func passwordRules(_ passwordRules: PasswordRule...) -> some View {
        environment(\.passwordRules, passwordRules)
    }
}
