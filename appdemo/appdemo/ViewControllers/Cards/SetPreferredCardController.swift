
import UIKit
import Foundation
import libwallet

class SetPreferredCardController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    @IBOutlet weak var cardId: UITextField!
    @IBAction func setPreferredCard(_ sender: Any) {
        guard !self.cardId.text!.isEmpty else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return;
        }
        let libServices = WalletApiService();
         libServices.setPreferredCard(cardId: self.cardId.text!);
        let alert = Utils.getAlert(title: "Sucesso", message: "Cartão favorito definido");
        self.present(alert, animated: true, completion: nil);
    }
    
}

