//
//  ViewModifiers+Editing.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

private struct EditingModifier<Value: Hashable>: ViewModifier {

    @Environment(\.editing) var editing

    @Binding var focus: (Value, Date)
    let value: Value
    let map: (Bool) -> Value

    init(_ focus: Binding<(Value, Date)>, value: Value, map: @escaping (Bool) -> Value) {
        self._focus = focus
        self.value = value
        self.map = map
    }

    func body(content: Content) -> some View {
        content
            .onPreferenceChange(OnEditingPreferenceKey.self) {
                focus = (map($0), .init())
            }
            .environment(\.editing, {
                if editing.1 > focus.1 {
                    return editing
                }

                return (focus.0 == value, focus.1)
            }())
    }
}

extension View {

    public func editing(_ binding: EditingState<Bool>.Binding) -> some View {
        modifier(EditingModifier(binding.state.$value, value: true) {
            $0
        })
    }

    public func editing<Value: Hashable>(_ binding: EditingState<Value?>.Binding, equals: Value) -> some View {
        modifier(EditingModifier(binding.state.$value, value: equals) {
            if $0 {
                return equals
            } else if binding.wrappedValue == equals {
                return nil
            } else {
                return binding.wrappedValue
            }
        })
    }
}
