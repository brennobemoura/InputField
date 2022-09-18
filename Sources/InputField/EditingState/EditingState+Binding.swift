//
//  EditingState+Binding.swift
//  
//
//  Created by onnerb on 18/09/22.
//

import Foundation

extension EditingState {

    @propertyWrapper
    public struct Binding {

        let state: EditingState<Value>

        init(_ state: EditingState<Value>) {
            self.state = state
        }

        public var projectedValue: Binding {
            self
        }

        public var wrappedValue: Value {
            get { state.wrappedValue }
            nonmutating
            set { state.wrappedValue = newValue }
        }
    }
}
