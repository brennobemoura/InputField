//
//  OnEditingPreferenceKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

struct OnEditingPreferenceKey: PreferenceKey {

    static var defaultValue: Bool = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}
