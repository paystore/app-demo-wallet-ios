import Foundation
import UIKit
import libwallet

class QRCodeDetails: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        setupView();
    }
    
    var qrcodeInfo:Any = ();
    
    @IBOutlet weak var payloadFormatIndicator: UILabel!
    @IBOutlet weak var pointOfInitiationMethod: UILabel!
    @IBOutlet weak var globallyUniqueIndentifier: UILabel!
    @IBOutlet weak var merchantAccountInformation: UILabel!
    @IBOutlet weak var logicNumber: UILabel!
    @IBOutlet weak var merchantCategoryCode: UILabel!
    @IBOutlet weak var transactionCurrency: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var merchantName: UILabel!
    @IBOutlet weak var merchantCity: UILabel!
    @IBOutlet weak var transactionGloballyUniqueIdentifier: UILabel!
    @IBOutlet weak var transactionID: UILabel!
    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var mainProduct: UILabel!
    @IBOutlet weak var subProduct: UILabel!
    @IBOutlet weak var paymentInstallments: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var crc: UILabel!
    
    
    func setupView(){
        let qrcode = qrcodeInfo as! QRCodeInfo
        
        self.payloadFormatIndicator.text = qrcode.payloadFormatIndicator;
        self.pointOfInitiationMethod.text = qrcode.pointOfInitiationMethod;
        self.globallyUniqueIndentifier.text = qrcode.merchantAccountInformation.globallyUniqueIdentifier;
        self.merchantAccountInformation.text = qrcode.merchantAccountInformation.merchantAccountInformation;
        self.logicNumber.text = qrcode.merchantAccountInformation.logicNumber;
        self.merchantCategoryCode.text = qrcode.merchantCategoryCode;
        self.transactionCurrency.text = qrcode.transactionCurrency;
        self.transactionAmount.text = qrcode.transactionAmount;
        self.countryCode.text = qrcode.countryCode;
        self.merchantName.text = qrcode.merchantName;
        self.merchantCity.text = qrcode.merchantCity;
        self.transactionGloballyUniqueIdentifier.text = qrcode.transactionInformation.transactionGloballyUniqueIdentifier;
        self.transactionID.text = qrcode.transactionInformation.transactionID;
        self.transactionDate.text = qrcode.transactionInformation.transactionDate;
        self.mainProduct.text = qrcode.transactionInformation.mainProduct;
        self.subProduct.text = qrcode.transactionInformation.subProduct;
        self.paymentInstallments.text = qrcode.transactionInformation.paymentInstallments;
        self.transactionType.text = qrcode.transactionInformation.transactionType;
        self.crc.text = qrcode.crc;
        
    }
}

