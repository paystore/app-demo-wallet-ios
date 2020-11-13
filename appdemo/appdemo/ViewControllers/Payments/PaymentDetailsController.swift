import Foundation
import UIKit

class PaymentDetailsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView();
    }
    
    @IBOutlet weak var lblPaymentId: UILabel!
    @IBOutlet weak var lblMerchantPaymentId: UILabel!
    @IBOutlet weak var lblPaymentDateTime: UILabel!
    @IBOutlet weak var lblAuthorizationCode: UILabel!
    
    var paymentId = String();
    var merchantPaymentId = String();
    var paymentDateTime = String();
    var authorizationCode = String();
    
    func setupView() {
        self.lblPaymentId.text = paymentId;
        self.lblMerchantPaymentId.text = merchantPaymentId;
        self.lblPaymentDateTime.text = paymentDateTime;
        self.lblAuthorizationCode.text = authorizationCode;
        
    }
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true);
    }
}
