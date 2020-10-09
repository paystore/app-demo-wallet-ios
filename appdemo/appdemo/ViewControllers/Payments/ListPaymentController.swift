import Foundation
import UIKit
import libwallet

class ListPaymentsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ListPaymentsCell.self, forCellReuseIdentifier: "payments")
    }
    
    var data = [GetPaymentResponse]();
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "payments") as! ListPaymentsCell
        
        cell.appTransactionId = data[indexPath.row].appTransactionId;
        cell.paymentId = data[indexPath.row].paymentId;
        cell.merchantPaymentId = data[indexPath.row].merchantPaymentId;
        cell.cardId = data[indexPath.row].cardId;
        return cell;
    }
    
}
