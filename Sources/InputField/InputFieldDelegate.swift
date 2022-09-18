//
//  InputFieldDelegate.swift
//
//
//  Created by onnerb on 18/09/22.
//

import UIKit

@MainActor
protocol InputFieldDelegate: AnyObject {

    func editingDidChange(_ isEditing: Bool)
    func textDidChange(_ text: String)
}
