//
//  InputField.ContentView.swift
//
//
//  Created by onnerb on 18/09/22.
//

import UIKit

extension InputField {

    @MainActor
    class ContentView: UIView {

        let input = TextField()

        weak var delegate: InputFieldDelegate?

        @MainActor
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension InputField.ContentView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let superview = superview {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
        }
    }
}

extension InputField.ContentView {

    private func buildHierarchy() {
        input.translatesAutoresizingMaskIntoConstraints = false
        addSubview(input)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            input.topAnchor.constraint(equalTo: topAnchor),
            input.bottomAnchor.constraint(equalTo: bottomAnchor),
            input.leadingAnchor.constraint(equalTo: leadingAnchor),
            input.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func applyAdditionalChanges() {
        input.addTarget(self, action: #selector(editingChanged), for: .allEditingEvents)
        input.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}

extension InputField.ContentView {

    @objc func editingChanged() {
        delegate?.editingDidChange(input.isEditing)
    }

    @objc func valueChanged() {
        delegate?.textDidChange(input.text ?? "")
    }
}
