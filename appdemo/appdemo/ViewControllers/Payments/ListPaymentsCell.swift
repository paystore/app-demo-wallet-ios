import Foundation
import UIKit

class ListPaymentsCell: UITableViewCell {

    var appTransactionId:String?;
    var paymentId:String?;
    var merchantPaymentId:String?;
    var cardId:String?;

    var appTransactionIdLabel: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var appTransactionIdValue: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var paymentIdLabel: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var paymentIdValue: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var merchantPaymentIdLabel: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var merchantPaymentIdValue: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var cardIdLabel: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();var cardIdValue: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier);
        self.addSubview(appTransactionIdLabel);
        self.addSubview(appTransactionIdValue);
        
        self.addSubview(paymentIdLabel);
        self.addSubview(paymentIdValue);
        
        self.addSubview(merchantPaymentIdLabel);
        self.addSubview(merchantPaymentIdValue);
        
        self.addSubview(cardIdLabel);
        self.addSubview(cardIdValue);
        
        appTransactionIdLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        appTransactionIdLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        appTransactionIdLabel.topAnchor.constraint(equalTo:self.topAnchor, constant:10).isActive = true
        
        appTransactionIdValue.leftAnchor.constraint(equalTo: self.appTransactionIdLabel.rightAnchor).isActive = true;
        appTransactionIdValue.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        appTransactionIdValue.topAnchor.constraint(equalTo: self.topAnchor, constant:10).isActive = true;
        
        paymentIdLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        paymentIdLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        paymentIdLabel.topAnchor.constraint(equalTo:self.topAnchor, constant:35).isActive = true
        
        paymentIdValue.leftAnchor.constraint(equalTo: self.paymentIdLabel.rightAnchor).isActive = true;
        paymentIdValue.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        paymentIdValue.topAnchor.constraint(equalTo: self.topAnchor, constant:35).isActive = true;
        
        merchantPaymentIdLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        merchantPaymentIdLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        merchantPaymentIdLabel.topAnchor.constraint(equalTo:self.topAnchor, constant:60).isActive = true
        
        merchantPaymentIdValue.leftAnchor.constraint(equalTo: self.merchantPaymentIdLabel.rightAnchor).isActive = true;
        merchantPaymentIdValue.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        merchantPaymentIdValue.topAnchor.constraint(equalTo: self.topAnchor, constant:60).isActive = true;
        
        cardIdLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        cardIdLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        cardIdLabel.topAnchor.constraint(equalTo:self.topAnchor, constant:85).isActive = true
        
        cardIdValue.leftAnchor.constraint(equalTo: self.cardIdLabel.rightAnchor).isActive = true;
        cardIdValue.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        cardIdValue.topAnchor.constraint(equalTo: self.topAnchor, constant:85).isActive = true;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        appTransactionIdLabel.text = "appTransactionId: "
        if let appTransactionId = appTransactionId {
            appTransactionIdValue.text = appTransactionId;
        }
        
        paymentIdLabel.text = "paymentId: "
        if let paymentId = paymentId {
            paymentIdValue.text = paymentId;
        }
        
        merchantPaymentIdLabel.text = "merchantPaymentId: "
        if let merchantPaymentId = merchantPaymentId {
            merchantPaymentIdValue.text = merchantPaymentId;
        }
        
        cardIdLabel.text = "cardId: "
        if let cardId = cardId {
            cardIdValue.text = cardId;
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
