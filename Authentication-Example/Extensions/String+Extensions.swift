//
//  String+Extensions.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation

extension String {
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
