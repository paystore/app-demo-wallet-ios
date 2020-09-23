
import UIKit
import Foundation
import libwallet

class SaveCardController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBOutlet weak var cardholderId: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var cardholderName: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    @IBOutlet weak var cvv: UITextField!
    
    @IBAction func saveCard(_ sender: Any) {
        guard !self.cardholderId.text!.isEmpty,
            !self.number.text!.isEmpty,
            !self.cardholderName.text!.isEmpty,
            !self.dueDate.text!.isEmpty,
            !self.cvv.text!.isEmpty
        else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return;
        }
        
        let createCardRequest = CreateCardRequest(cardholderId: self.cardholderId.text!, number: self.number.text!, cardholderName:  self.cardholderName.text!, dueDate: self.dueDate.text!, cvv: self.cvv.text!);
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        
        libServices.saveCard(createCardRequest: createCardRequest){
            (response, failure, error) in
            if(response != nil){
                if let createCardResponse:CreateCardResponse = response {
                    DispatchQueue.main.async {
                        let alertSuccess = Utils.alertSuccess(id:createCardResponse.id);
                        self.present(alertSuccess, animated: true)
                    }
                }
            }else if(failure != nil){
                if let generalErrorResponse:GeneralErrorResponse = failure {
                    DispatchQueue.main.async {
                        let alertError = Utils.alertError(timestamp: generalErrorResponse.timestamp as! String, status: String(generalErrorResponse.status), error: generalErrorResponse.error, message: generalErrorResponse.message);

                        self.present(alertError, animated: true)
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

