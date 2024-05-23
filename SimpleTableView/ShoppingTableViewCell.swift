//
//  ShoppingTableViewCell.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import UIKit

protocol ShoppingDelegate {
    func checkBoxClicked(idx: Int, isClicked: Bool)
}

class ShoppingTableViewCell: UITableViewCell {

    var delegate: ShoppingDelegate?
    var index: Int?
    var isCheckboxClicked = false {
        didSet{
            if isCheckboxClicked == true{
                checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }else{
                checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }
        }
    }
    
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var checkboxButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func checkboxClicked(_ sender: UIButton) {
        guard let idx = index else{ return }
        isCheckboxClicked = !isCheckboxClicked
        delegate?.checkBoxClicked(idx: idx, isClicked: isCheckboxClicked)
    }
    

}
