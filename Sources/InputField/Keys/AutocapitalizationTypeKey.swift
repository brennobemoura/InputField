//
//  AutocapitalizationTypeKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct AutocapitalizationTypeKey: EnvironmentKey {
    static var defaultValue: UITextAutocapitalizationType = .none
}

extension EnvironmentValues {

    var autocapitalization: UITextAutocapitalizationType {
        get { self[AutocapitalizationTypeKey.self] }
        set { self[AutocapitalizationTypeKey.self] = newValue }
    }
}

extension View {

    public func capitalization(_ type: UITextAutocapitalizationType) -> some View {
        environment(\.autocapitalization, type)
    }
}
