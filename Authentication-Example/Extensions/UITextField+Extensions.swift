//
//  UITextField+Extensions.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation
import UIKit

extension UITextField {
    func validate(type: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validateFor(type: type)
        return try validator.validated(self.text!)
    }
}
