//
//  OnChangeModifier.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI
import Combine

private struct OnChangeModifier<V: Equatable>: ViewModifier {

    typealias Action = (V) -> Void

    private let newValue: V
    private let newAction: Action

    @State private var state: (V, Action)?

    init(newValue: V, action: @escaping Action) {
        self.newValue = newValue
        self.newAction = action
    }

    func body(content: Content) -> some View {
        if #available(iOS 14, *) {
            assertionFailure("Please don't use this ViewModifer directly and use the `onChange(of:perform:)` modifier instead.")
        }

        return content
            .onAppear()
            .onReceive(Just(newValue)) { newValue in
                if let (currentValue, action) = state, newValue != currentValue {
                    action(newValue)
                }
                state = (newValue, newAction)
            }
    }
}

extension View {

    @_disfavoredOverload
    @ViewBuilder
    public func onChange<V>(
        of value: V,
        perform action: @escaping (V) -> Void
    ) -> some View where V: Equatable {
        if #available(iOS 14, *) {
            onChange(of: value, perform: action)
        } else {
            modifier(OnChangeModifier(newValue: value, action: action))
        }
    }
}
