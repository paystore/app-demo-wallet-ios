import Foundation
import UIKit

class CardMenuController: UITableViewController {
    
    var options:[String] =  ["Cadastrar cartão do portador", "Ativar cartão", "Desativar cartão", "Definir cartão como favorito", "Remover Cartão do portador", "Obter cartão específico", "Listar cartões"];
    
    var forms = ["saveCard", "activateCard", "deactivateCard", "setPreferredCard", "removeCard", "getCard", "getCards"];
    
    
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
