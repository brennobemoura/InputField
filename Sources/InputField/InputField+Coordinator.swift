//
//  InputField+Coordinator.swift
//
//
//  Created by onnerb on 18/09/22.
//

import UIKit

extension InputField {

    @MainActor
    class Coordinator: InputFieldDelegate {

        let representable: Representable

        init(_ representable: Representable) {
            self.representable = representable
        }

        func textDidChange(_ text: String) {
            if text != representable.text {
                representable.text = text
            }
        }

        func editingDidChange(_ isEditing: Bool) {
            if representable.isEditing != isEditing {
                representable.isEditing = isEditing
            }
        }
    }
}
