//
//  InputField.Label.swift
//
//
//  Created by onnerb on 18/09/22.
//

import SwiftUI

extension InputField {

    public struct Label: View {

        private let representable: InputField.Representable

        init(_ representable: InputField.Representable) {
            self.representable = representable
        }

        public var body: some View {
            representable
        }
    }
}
