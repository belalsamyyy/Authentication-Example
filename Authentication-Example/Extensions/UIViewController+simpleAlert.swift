//
//  UIViewController+simpleAlert.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
