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
    }
    
    @IBAction func clickAddButton(_ sender: UIButton) {
        if productTextField.text?.trimmingCharacters(in: .whitespaces) != "" {
            shoppingList.append(productTextField.text!)
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell")!
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

}
