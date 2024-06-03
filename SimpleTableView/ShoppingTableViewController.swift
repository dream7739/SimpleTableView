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
        print(#function, sender.tag)
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func isCheckboxClicked(sender: UIButton){
        shoppingList[sender.tag].isChecked.toggle()
        print(#function, sender.tag)

        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    private func designButton(_ sender : UIButton){
        sender.layer.cornerRadius = 10
    }
    
    private func designTextField(_ sender : UITextField){
        sender.layer.cornerRadius = 10
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 60))
        sender.leftView = emptyView
        sender.leftViewMode = .always
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if shoppingList.isEmpty {
            return 1
        }else{
            return shoppingList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if shoppingList.isEmpty {
            return 400
        }else{
            return 65
        }
    }
    
    //EditingStyle을 지정. (.insert, .delete, .none)
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return shoppingList.isEmpty ? .none : .delete
    }
    
    //dataSource에서 특정 행의 삽입, 삭제를 반영하도록 요청
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
            // deleteRows - cellForRowAt호출안됨
            // 기존에 데이터가 있을 때는 잘 삭제 되다가 데이터가 없을 때 셀을 바꿔야하는데 여기서 문제가 생김
            // reloadData로 실행하면 cellForRowAt에 실행
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell, indexPatht설정하는 dequeueReusableaCell for 사용
        if shoppingList.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
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
}

