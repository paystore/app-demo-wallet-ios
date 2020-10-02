import Foundation
import UIKit
import libwallet

class CreateCardholderController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var nationalId: UITextField!
    @IBOutlet weak var cellphoneNumber: UITextField!
    @IBOutlet weak var birthDate: UITextField!
    
    @IBAction func createCardholder(_ sender: Any) {
        
        guard
            !self.fullName.text!.isEmpty,
            !self.email.text!.isEmpty,
            !self.nationalId.text!.isEmpty,
            !self.cellphoneNumber.text!.isEmpty,
            !self.birthDate.text!.isEmpty  else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return;
        }
        
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        
        let notificationToken = Utils.getNotificationToken();
        
        let cardholder = CreateCardholderRequestDTO(fullName: self.fullName.text!, email: self.email.text!, nationalId: self.nationalId.text!, birthDate: self.birthDate.text!, cellphoneNumber: self.cellphoneNumber.text!, notificationToken:notificationToken);
        
        libServices.createCardholder(cardholder:cardholder){
            (response, failure, error) in
            if(response != nil){
                if let createCardholderResponse:SaveCardholderResponse = response {
                    DispatchQueue.main.async {
                        let alertSuccess = Utils.alertSuccess(id:createCardholderResponse.id);
                        self.present(alertSuccess, animated: true)
                    }
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
                    DispatchQueue.main.async {
                        let alert = Utils.getAlert(title: "Erro", message: error.localizedDescription);
                        self.present(alert, animated: true, completion: nil);
                    }
                    
                }
            }
        };
        

    }
}

