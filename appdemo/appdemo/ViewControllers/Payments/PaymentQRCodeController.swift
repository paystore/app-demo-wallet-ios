import Foundation
import UIKit
import libwallet

class PaymentQRCodeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        qrcodeData?.text = self.qrcodeString;
    }
    
    var qrcodeString = String();
    
    @IBOutlet weak var qrcodeData: UILabel!
    @IBOutlet weak var cardId: UITextField!
    @IBOutlet weak var cardholderId: UITextField!
    @IBOutlet weak var appTransactionId: UITextField!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var ip: UITextField!
    
    
    
    @IBAction func createPayment(_ sender: Any) {
        guard
            !self.qrcodeData.text!.isEmpty,
            !self.cardholderId.text!.isEmpty,
            !self.appTransactionId.text!.isEmpty,
            !self.ip.text!.isEmpty
            else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return
        }
        
        let createPaymentRequest = CreatePaymentRequest(
            appTransactionId:self.appTransactionId.text!,
            qrcodeData:self.qrcodeData.text!,
            cardId:self.cardId.text!,
            cvv:self.cvv.text ?? nil,
            cardholderId:self.cardholderId.text!,
            ip:self.ip.text!
        );
        
        let libServices = WalletApiService(authorization: Utils.getEcommerceToken(), baseUrlWallet: Utils.getBaseUrl());
        libServices.startPayment(createPaymentRequest: createPaymentRequest){
            (response, failure, error) in
            if(response != nil){
                if let response:CreatePaymentResponse = response{
                    DispatchQueue.main.async {
                        let alertSuccess = Utils.showPaymentDetails(payment: response);
                        self.present(alertSuccess, animated: true)
                    }
                }
                
            }else if(failure != nil) {
                if let generalErrorResponse:GeneralErrorResponse = failure{
                    DispatchQueue.main.async {
                        print(generalErrorResponse.message)
                        print(generalErrorResponse.errors)
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
    
    @IBAction func getIp(_ sender: Any) {
        let url = URL(string: "http://checkip.amazonaws.com/") ;
        
        var request : URLRequest = URLRequest(url: url!);
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                if let response = response as? HTTPURLResponse{
                    //Resposta de Sucesso
                    if((200...299) ~= response.statusCode){
                        let ip = String(data: data, encoding: .utf8);
                        DispatchQueue.main.async {
                            let alert = Utils.getAlert(title: "Sucesso", message: "IP obtido");
                            self.present(alert, animated: true, completion: nil);
                            self.ip.text = ip!.trimmingCharacters(in: .whitespacesAndNewlines);
                        }
                    }else{
                        DispatchQueue.main.async {
                            let alert = Utils.getAlert(title: "Erro", message: "Não foi possível obter o token");
                            self.present(alert, animated: true, completion: nil);
                        }
                    }
                }
            }
            else {
                //Não houve resposta
                print("Não houve resposta");
            }
        }
        //Aciona a tarefa
        task.resume();
    }
    
}
