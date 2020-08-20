import Foundation

import UIKit
import ProxyConfig

class ProtocolTableViewController: UITableViewController {
    
    let list: [String] = ProxyConfig.protocolList
    
    var selectedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItem = ProxyConfig.getStringConfig(name: ProxyConfig.ConfigKey.Proto.rawValue)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let itemCell = tableView.dequeueReusableCell(withIdentifier: "item-cell") {
            let idx = ((indexPath as NSIndexPath).row)
            let item = list[idx]
            cell = itemCell
            cell.textLabel?.text = item.description
            cell.textLabel?.font = cell.textLabel?.font.withSize(15)
            if list[idx] == selectedItem {
                cell.accessoryType = .checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = list[indexPath.row]
        ProxyConfig.storeStringConfig(name: ProxyConfig.ConfigKey.Proto.rawValue, value: selectedItem!)
        navigationController?.popViewController(animated: true)
    }
}
