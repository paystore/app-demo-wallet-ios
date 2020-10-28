
import UIKit
import Foundation
import libwallet

class RecoverCardholderController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    @IBOutlet weak var cellphoneNumber: UITextField!
    @IBOutlet weak var nationalId: UITextField!
    
    @IBAction func recoverCardholder(_ sender: Any) {
        
        guard  !self.cellphoneNumber.text!.isEmpty,
            !self.nationalId.text!.isEmpty else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return;
        }
        
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        
        let notificationToken = Utils.getNotificationToken();
        
        let revalidateCardholder = RevalidateCardholderRequestDTO(cellphoneNumber: self.cellphoneNumber.text!, notificationToken:notificationToken);
        
        libServices.revalidateCardholder(nationalId:self.nationalId.text!, revalidateCardholderRequest: revalidateCardholder){
            (response, failure, error) in
            if(response != nil){
                if let revalidateCardholderResponse:SaveCardholderResponse = response {
                    DispatchQueue.main.async {
                        let alertSuccess = Utils.alertSuccess(id:revalidateCardholderResponse.id);
                        self.present(alertSuccess, animated: true)
                    }
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
