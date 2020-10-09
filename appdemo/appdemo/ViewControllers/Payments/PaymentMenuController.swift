import Foundation
import UIKit

class PaymentMenuController: UITableViewController {
    
    var options:[String] = ["Ler informações do QR Code", "Pagar com QRCode", "Listar pagamentos"];
    var forms = ["readQRCode", "paymentQRCode", "consultPayment"];
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = "options";
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        cell.textLabel?.text = options[indexPath.row];
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: forms[indexPath.row], sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
