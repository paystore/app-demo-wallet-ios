

import UIKit

class ErrorViewController: UIViewController {

    @IBOutlet weak var lblTimestamp: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    var timestamp = String()
    var status = String()
    var error = String()
    var message = String()

    
    var buttonAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView();
    }

    func setupView() {
        
        lblTimestamp.text = timestamp;
        lblStatus.text = status;
        lblError.text = error;
        lblMessage.text = message;

    }
    
    @IBAction func onDismiss(_ sender: Any) {
        dismiss(animated: true);
    }
    
    
}
