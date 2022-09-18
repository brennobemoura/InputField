//
//  InputField+TextField.swift
//
//
//  Created by onnerb on 18/09/22.
//

import UIKit

extension InputField {

    class TextField: UITextField {

        override var text: String? {
            get {
                if let mask = inputMask {
                    return mask.mask(super.text ?? "")
                } else {
                    return super.text
                }
            }
            set {
                if let mask = inputMask {
                    super.text = mask.mask(newValue ?? "")
                } else {
                    super.text = newValue
                }
            }
        }

        var inputMask: InputMask? {
            didSet {
                if oldValue?.rawValue != inputMask?.rawValue {
                    textDidChange()
                }
            }
        }

        init() {
            super.init(frame: .zero)
            addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        @objc
        func textDidChange() {
            let currentValue = super.text
            self.text = currentValue
            if text != currentValue {
                sendActions(for: .editingChanged)
            }
        }
    }
}
