//
//  ReturnKeyKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct ReturnKeyKey: EnvironmentKey {
    static var defaultValue: UIReturnKeyType = .default
}

extension EnvironmentValues {

    var returnKey: UIReturnKeyType {
        get { self[ReturnKeyKey.self] }
        set { self[ReturnKeyKey.self] = newValue }
    }
}

extension View {

    public func returnKey(_ returnKey: UIReturnKeyType) -> some View {
        environment(\.returnKey, returnKey)
    }
}
