//
//  ClearsOnBeginEditingKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct ClearsOnBeginEditingKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {

    var clearsOnBeginEditing: Bool {
        get { self[ClearsOnBeginEditingKey.self] }
        set { self[ClearsOnBeginEditingKey.self] = newValue }
    }
}

extension View {

    public func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> some View {
        environment(\.clearsOnBeginEditing, clearsOnBeginEditing)
    }
}
