import Foundation
import UIKit
import libwallet

class ReadQRCodeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        qrcodeData.text = "00020101021226440008PayStore0116123456789012000102082009130352040000530398654120000000001005802BR5909SENFFCARD6011CURITIBA PR 801050037\"https://www.senffcard.com.br/qrcode\"011613050329197F190A0212150518113349030410000404000105020006020163049872";
    }
    
    var qrcodeInfo:Any = ();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrcodeDetails" {
            let nextView = segue.destination as! QRCodeDetails;
            nextView.qrcodeInfo = qrcodeInfo;
        }
    }
    
    @IBOutlet weak var qrcodeData: UITextField!
    @IBAction func read(_ sender: Any) {
        guard !self.qrcodeData.text!.isEmpty else {
            let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
            present(alert, animated: true, completion: nil);
            return
        }
            let libServices = WalletApiService();
            do {
                let qrCodeInfo:QRCodeInfo = try libServices.getQRCodeInfo(qrCodeData: qrcodeData.text!);
                self.qrcodeInfo = qrCodeInfo;
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "qrcodeDetails", sender: self)
                }
                
            } catch  {
                print(error.localizedDescription)
            }
    }
}
