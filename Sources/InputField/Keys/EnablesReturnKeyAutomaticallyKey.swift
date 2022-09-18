//
//  EnablesReturnKeyAutomaticallyKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct EnablesReturnKeyAutomaticallyKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {

    var enablesReturnKeyAutomatically: Bool {
        get { self[EnablesReturnKeyAutomaticallyKey.self] }
        set { self[EnablesReturnKeyAutomaticallyKey.self] = newValue }
    }
}

extension View {

    public func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> some View {
        environment(\.enablesReturnKeyAutomatically, enablesReturnKeyAutomatically)
    }
}
