//
//  TextContentTypeKey.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct TextContentTypeKey: EnvironmentKey {
    static var defaultValue: UITextContentType?
}

extension EnvironmentValues {

    var textContent: UITextContentType? {
        get { self[TextContentTypeKey.self] }
        set { self[TextContentTypeKey.self] = newValue }
    }
}

extension View {

    public func textContent(_ type: UITextContentType?) -> some View {
        environment(\.textContent, type)
    }
}
