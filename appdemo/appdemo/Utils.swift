import UIKit
import Foundation
import libwallet

class Utils {
    static func getEcommerceToken() -> String {
        let token = AppConfig.get(key: AppConfig.AUTH_TOKEN_KEY);
        return "Bearer " + token;
    }
    
    static func getBaseUrl() -> String {
        let baseUrlWallet = AppConfig.get(key: AppConfig.BASE_URL_KEY);
        return baseUrlWallet;
    }
    
    static func getNotificationToken() -> String {
        let notificationToken = AppConfig.get(key: AppConfig.NOTIFY_TOKEN_KEY);
        return notificationToken;
    }
    
    static func getAlert(title:String, message:String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let onCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil);
        
        alert.addAction( onCancel );
        return alert;
    }
    
    static func alertError(timestamp:String, status:String, error:String, message:String) -> ErrorViewController {
        
        let storyboard = UIStoryboard(name: "ModalScreen", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "ErrorScreen") as! ErrorViewController
        
        alertVC.timestamp = timestamp
        alertVC.status = status
        alertVC.error = error
        alertVC.message = message
        
        return alertVC
    }
    
    static func alertSuccess(id:String) -> SuccessAlertController {
        
        let storyboard = UIStoryboard(name: "ModalScreen", bundle: .main)
        
        let alertSuccess = storyboard.instantiateViewController(withIdentifier: "SuccessScreen") as! SuccessAlertController
        
        alertSuccess.id = id;

        return alertSuccess
    }
    
    static func showCardDetails(card:GetCardResponse) -> CardDetailsController {
        
        let storyboard = UIStoryboard(name: "ModalScreen", bundle: .main)
        
        let cardDetails = storyboard.instantiateViewController(withIdentifier: "DetailsScreen") as! CardDetailsController
        
        cardDetails.id = card.id;
        cardDetails.number = card.number;
        cardDetails.cardholderName = card.cardholderName;
        cardDetails.dueDate = card.dueDate;
        cardDetails.active = card.active;
        
        return cardDetails
    }
    
    static func showPaymentDetails(payment:CreatePaymentResponse) -> PaymentDetailsController {
        
        let storyboard = UIStoryboard(name: "ModalScreen", bundle: .main)
        
        let paymentDetails = storyboard.instantiateViewController(withIdentifier: "PaymentDetailsScreen") as! PaymentDetailsController
        
        paymentDetails.paymentId = payment.paymentId;
        paymentDetails.merchantPaymentId = payment.merchantPaymentId;
        paymentDetails.paymentDateTime = payment.paymentDateTime;
        paymentDetails.authorizationCode = payment.authorizationCode;
        
        return paymentDetails
    }

}
