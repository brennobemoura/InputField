//
//  EditingState.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

@propertyWrapper
public struct EditingState<Value>: DynamicProperty where Value: Hashable {

    @State var value: (Value, Date)

    public init() where Value == Bool {
        _value = .init(wrappedValue: (false, .init()))
    }

    public init() where Value: ExpressibleByNilLiteral {
        _value = .init(wrappedValue: (nil, .init()))
    }

    public var wrappedValue: Value {
        get { value.0 }
        nonmutating
        set {
            value.0 = newValue
            value.1 = .init()
        }
    }

    public var projectedValue: Binding {
        .init(self)
    }
}
