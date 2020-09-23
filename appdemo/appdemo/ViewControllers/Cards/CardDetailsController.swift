import Foundation
import UIKit

class CardDetailsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView();
    }
    
    var id = String();
    var number = String();
    var cardholderName = String();
    var dueDate = String();
    var active = Bool();
    
   
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblCardholderName: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblActive: UILabel!
    
    func setupView() {
        
        lblId.text = id;
        lblNumber.text = number;
        lblCardholderName.text = cardholderName;
        lblDueDate.text = dueDate;
        lblActive.text = String(active);
    }
    
    @IBAction func onDismiss(_ sender: Any) {
        dismiss(animated: true);
    }
}
