import Foundation
import UIKit
import libwallet

class ConsultPaymentsController: UIViewController {
    

    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var finishDate: UITextField!
    @IBOutlet weak var status: UITextField!
    @IBOutlet weak var startAmount: UITextField!
    @IBOutlet weak var finishAmount: UITextField!
    @IBOutlet weak var cardId: UITextField!
    
    var content = [GetPaymentResponse]();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listPayments" {
            let nextView = segue.destination as! ListPaymentsController;
            nextView.data = content;
        }
    }
    
    @IBAction func send(_ sender: Any) {
        guard !self.startDate.text!.isEmpty, !self.finishDate.text!.isEmpty else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return
        }
        
        let listPaymentRequest = ListPaymentRequest(startDate: self.startDate.text!,
                                                    finishDate: self.finishDate.text!,
                                                    status:self.status.text,
                                                    startAmount:Int(self.startAmount.text!),
                                                    finishAmount:Int(self.finishAmount.text!),
                                                    cardId:self.cardId.text,
                                                    pageSize:10,
                                                    page:1);
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        libServices.listPayments(listPaymentRequest: listPaymentRequest){
            (response, failure, error) in
            if(response != nil){
                if let getPaymentResponsePage:GetPaymentResponsePage = response {
                    let content:Array<GetPaymentResponse> = getPaymentResponsePage.content;
                    print(content);
                    if(content.count > 0){
                        self.content = content;
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "listPayments", sender: self)
                        }
                    }else{
                        DispatchQueue.main.async {
                            let alert = Utils.getAlert(title: "Info", message: "Nenhum pagamento encontrado");
                            self.present(alert, animated: true, completion: nil);
                            return;
                        }
                    }
                    
                }
            }else if(failure != nil){
                if let generalErrorResponse:GeneralErrorResponse = failure{
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
