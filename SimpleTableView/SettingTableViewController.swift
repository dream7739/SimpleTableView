//
//  SettingTableViewController.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total
    case personal
    case others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    private let settingTitle = [["공지사항", "실험실", "버전정보"],
    ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    private let settingSectionTitle = ["전체설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOptions
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        return cell
    }
 

}
