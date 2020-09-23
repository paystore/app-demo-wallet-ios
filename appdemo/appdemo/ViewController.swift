import UIKit
import libwallet
import DeviceCheck

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Config",  style: .plain, target: self, action: #selector(navConfig));
     
    }
    
    @objc func navConfig(){
        performSegue(withIdentifier: "config", sender: self)
    }
    
    var options:[String] = ["Portadores", "Cartões dos portadores", "Pagamento"];
    let menusId:[String] = ["cardholders", "cards", "payment"];
    
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
        performSegue(withIdentifier: menusId[indexPath.row], sender: self);
    }
}
