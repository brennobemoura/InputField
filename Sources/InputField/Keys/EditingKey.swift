//
//  EditingKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

struct EditingKey: EnvironmentKey {
    static var defaultValue: (Bool, Date) = (false, .distantPast)
}

extension EnvironmentValues {

    var editing: (Bool, Date) {
        get { self[EditingKey.self] }
        set { self[EditingKey.self] = newValue }
    }
}
