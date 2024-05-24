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
    
    private var shoppingList: [Shopping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton(addButton)
        designTextField(productTextField)
        
        tableView.rowHeight = 65
    }
    
    @IBAction func clickAddButton(_ sender: UIButton) {
        guard let productText = productTextField.text,
              productText.trimmingCharacters(in: .whitespaces).isEmpty == false
        else{
            showAlert(t: "알림", msg: "물품 정보를 입력해주세요", style: .alert)
            return
        }
        
        shoppingList.append(Shopping(productName: productText))
        productTextField.text = ""
        tableView.reloadData()
    }
    
    @objc func isBookmarkClicked(sender: UIButton){
        shoppingList[sender.tag].isBookmarked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func isCheckboxClicked(sender: UIButton){
        shoppingList[sender.tag].isChecked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    func designButton(_ sender : UIButton){
        sender.layer.cornerRadius = 10

    }
    
    func designTextField(_ sender : UITextField){
        sender.layer.cornerRadius = 10
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        sender.leftView = emptyView
        sender.leftViewMode = .always
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell, indexPatht설정하는 dequeueReusableCell for 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let data = shoppingList[indexPath.row]

        cell.productBackgroundView.layer.cornerRadius = 10
        cell.productLabel.text = data.productName

        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(isBookmarkClicked), for: .touchUpInside)
        let bookmarkImage = data.isBookmarked ? "star.fill" : "star"
        cell.bookmarkButton.setImage(UIImage(systemName: bookmarkImage), for: .normal)
        
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(isCheckboxClicked), for: .touchUpInside)
        let checkboxImage = data.isChecked ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: checkboxImage), for: .normal)

        return cell
    }
    
}

