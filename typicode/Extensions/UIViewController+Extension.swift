//
//  UIViewController+Extension.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String?, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}
