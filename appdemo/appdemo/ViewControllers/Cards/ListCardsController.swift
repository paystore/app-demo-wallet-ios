import Foundation
import UIKit
import libwallet

class ListCardsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ListCardsCell.self, forCellReuseIdentifier: "cards")
    }
    
    var data = [GetCardResponse]();
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cards") as! ListCardsCell;
        cell.id = data[indexPath.row].id;
        cell.number = data[indexPath.row].number;
        cell.cardholderName = data[indexPath.row].cardholderName;
        cell.dueDate = data[indexPath.row].dueDate;
        cell.active = data[indexPath.row].active;
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIPasteboard.general.string = data[indexPath.row].id;
        let alert = Utils.getAlert(title: "Info", message: "id do cartão copiado!");
        present(alert, animated: true, completion: nil);
    }
    
 
}
