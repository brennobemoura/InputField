//
//  ClearsOnInsertionKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct ClearsOnInsertionKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {

    var clearsOnInsertion: Bool {
        get { self[ClearsOnInsertionKey.self] }
        set { self[ClearsOnInsertionKey.self] = newValue }
    }
}

extension View {

    public func clearsOnInsertion(_ clearsOnInsertion: Bool) -> some View {
        environment(\.clearsOnInsertion, clearsOnInsertion)
    }
}
