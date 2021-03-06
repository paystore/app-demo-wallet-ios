
import UIKit
import Foundation
import libwallet

class ActivateCardController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    @IBOutlet weak var cardId: UITextField!
    @IBAction func activateCard(_ sender: Any) {
        guard !self.cardId.text!.isEmpty else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return;
        }
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        libServices.activateCard(cardId: self.cardId.text!){
            (response, failure, error) in
            if(response != nil){
                DispatchQueue.main.async {
                    let alert = Utils.getAlert(title: "Sucesso", message: "Cartão ativado");
                    self.present(alert, animated: true, completion: nil);
                }
            }else if(failure != nil){
                if let generalErrorResponse:GeneralErrorResponse = failure {
                    DispatchQueue.main.async {
                        let alertError = Utils.alertError(
                            timestamp: generalErrorResponse.timestamp as? String ?? String(),
                            status: String(generalErrorResponse.status),
                            error: generalErrorResponse.error,
                            message: generalErrorResponse.message
                        );
                        
                        self.present(alertError, animated: true);
                    }
                }
            }else{
                if let error = error {
                    DispatchQueue.main.async {
                        let alert = Utils.getAlert(title: "Erro", message: error.localizedDescription);
                        self.present(alert, animated: true, completion: nil);
                    }
                }
            }
        }
    }
}

