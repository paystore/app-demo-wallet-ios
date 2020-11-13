
import UIKit
import Foundation
import libwallet

class GetCardsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    var getCardsResponsePage = [GetCardResponse]();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listCards" {
            let nextView = segue.destination as! ListCardsController;
            nextView.data = getCardsResponsePage;
        }
    }
    
    @IBOutlet weak var cardholderId: UITextField!
    @IBAction func getCards(_ sender: Any) {
        guard !self.cardholderId.text!.isEmpty else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return;
        }
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        libServices.getCards(cardholderId: self.cardholderId.text!){
            (response, failure, error) in
            if(response != nil){
                if let response = response {
                    self.getCardsResponsePage = response;
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "listCards", sender: self)
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

