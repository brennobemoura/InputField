//
//  InputMask.swift
//  
//
//  Created by onnerb on 18/09/22.
//

import Foundation

public protocol InputMask {

    var rawValue: Int { get }

    func mask(_ text: String) -> String
}
