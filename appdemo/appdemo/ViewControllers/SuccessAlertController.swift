import Foundation
import UIKit


class SuccessAlertController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        setupView();
    }

    @IBOutlet weak var lblSuccess: UILabel!
    var id = String()
    
    
    func setupView() {
        
        lblSuccess.text = id;
        
    }
    

    @IBAction func copyCode(_ sender: Any) {
        UIPasteboard.general.string = id;
        dismiss(animated: true);
    }
}
