//
//  KeyboardTypeKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct KeyboardTypeKey: EnvironmentKey {
    static var defaultValue: UIKeyboardType = .default
}

extension EnvironmentValues {

    var keyboard: UIKeyboardType {
        get { self[KeyboardTypeKey.self] }
        set { self[KeyboardTypeKey.self] = newValue }
    }
}

extension View {

    public func keyboard(_ type: UIKeyboardType) -> some View {
        environment(\.keyboard, type)
    }
}
