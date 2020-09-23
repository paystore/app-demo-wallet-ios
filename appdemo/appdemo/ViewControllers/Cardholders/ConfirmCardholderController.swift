
import UIKit
import Foundation
import libwallet


class ConfirmCardholderController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    @IBOutlet weak var cardholderId: UITextField!
    @IBOutlet weak var activationCode: UITextField!
    
    @IBAction func confirmCardholder(_ sender: Any) {
        guard !self.cardholderId.text!.isEmpty,
            !self.activationCode.text!.isEmpty else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return;
        }
        
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        let confirmCardholderRequest = ConfirmCardholderRequest(cardholderId: self.cardholderId.text!, activationCode: activationCode.text!);
        libServices.confirmCardholder(confirmCardholderRequest: confirmCardholderRequest){
            (response, failure, error) in
            if(response != nil){
                DispatchQueue.main.async {
                    let alert = Utils.getAlert(title: "Successo", message: "Confirmação realizada com sucesso");
                    self.present(alert, animated: true, completion: nil);
                }
            }else if(failure != nil) {
                if let generalErrorResponse:GeneralErrorResponse = failure {
                    DispatchQueue.main.async {
                        let alertError = Utils.alertError(timestamp: generalErrorResponse.timestamp as! String, status: String(generalErrorResponse.status), error: generalErrorResponse.error, message: generalErrorResponse.message);
                        
                        self.present(alertError, animated: true)
                    }
                }
            }else{
                if let error = error {
                    let alert = Utils.getAlert(title: "Erro", message: error.localizedDescription);
                    self.present(alert, animated: true, completion: nil);
                }
            }
        }
    }
    
}
