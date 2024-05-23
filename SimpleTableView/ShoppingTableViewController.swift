//
//  ShoppingTableViewController.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var productTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    private var shoppingList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = 10
        
        productTextField.layer.cornerRadius = 10
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        productTextField.leftView = emptyView
        productTextField.leftViewMode = .always
        
    }
    
    @IBAction func clickAddButton(_ sender: UIButton) {
        let productText = productTextField.text?.trimmingCharacters(in: .whitespaces)
        
        if productText != "" {
            shoppingList.append(productTextField.text!)
            tableView.reloadData()
        }else{
            showAlert(t: "알림", msg: "물품 정보를 입력해주세요", style: .alert)
        }
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell") as? ShoppingTableViewCell else { return UITableViewCell() }
        cell.productLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
}
