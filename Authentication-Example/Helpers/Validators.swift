//
//  Validator.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation
import UIKit

//MARK: - Validation Factory

struct ValidationError: Error {
    var message: String
    init(_ message: String) {
        self.message = message
    }
}


protocol ValidatorProtocol {
    func validated(_ value: String) throws -> String
}


enum ValidatorType {
    case required(String)
    case email
    case password
    case confirm(UITextField)
}


enum ValidatorFactory {
    static func validateFor(type: ValidatorType) -> ValidatorProtocol {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .required(let fieldName): return RequiredValidator(fieldName)
        case .confirm(let field): return ConfirmValidator(field)}
    }
}


//MARK: - Validators

struct EmailValidator: ValidatorProtocol {
    func validated(_ value: String) throws -> String {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailtest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard !value.isBlank else { throw ValidationError("Email Address is empty !") }
        guard emailtest.evaluate(with: value) else { throw ValidationError("Invalid Email Address") }
        
        return value
    }
}

struct PasswordValidator: ValidatorProtocol {
    func validated(_ value: String) throws -> String {
        guard !value.isBlank else { throw ValidationError("Password is empty !") }
        guard value.count >= 8 else { throw ValidationError("Password should be at least 8 characters !") }
        return value
    }
}

struct RequiredValidator: ValidatorProtocol {
    private let fieldName: String
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isBlank else { throw ValidationError("\(fieldName) is required !")}
        return value
    }
}

struct ConfirmValidator: ValidatorProtocol {
    private let field: UITextField
    init(_ field: UITextField) {
        self.field = field
    }
    func validated(_ value: String) throws -> String {
        guard !value.isBlank else { throw ValidationError("Confirm Password is empty !")}
        guard value == field.text else { throw ValidationError("Confirm password and password aren't equal !") }
        return value
    }
}
