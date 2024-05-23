//
//  UIViewController + Extension.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import UIKit

extension UIViewController {
    func showAlert(t: String, msg: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: t, message: msg, preferredStyle: style)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
