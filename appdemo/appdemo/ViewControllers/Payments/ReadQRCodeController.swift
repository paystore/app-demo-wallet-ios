import Foundation
import UIKit
import libwallet

class ReadQRCodeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        qrcodeData.text = self.qrcodeDataString;
    }
    
    var qrcodeInfo:Any = ();
    var qrcodeDataString = String();
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrcodeDetails" {
            let nextView = segue.destination as! QRCodeDetails;
            nextView.qrcodeInfo = qrcodeInfo;
        }
    }
    
    @IBOutlet weak var qrcodeData: UILabel!
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
