//
//  TextMaskKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

struct InputMaskKey: EnvironmentKey {
    static var defaultValue: InputMask?
}

extension EnvironmentValues {

    var inputMask: InputMask? {
        get { self[InputMaskKey.self] }
        set { self[InputMaskKey.self] = newValue }
    }
}

extension View {

    public func inputMask(_ inputMask: InputMask?) -> some View {
        environment(\.inputMask, inputMask)
    }
}
