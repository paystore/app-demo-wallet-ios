import Foundation
import UIKit

class ListCardsCell: UITableViewCell {
    
    var id:String?;
    var number:String?;
    var cardholderName:String?;
    var dueDate:String?;
    var active:Bool?;

    var idValueView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var idLabelView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var numberValueView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var numberLabelView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var cardholderNameValueView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var cardholderNameLabelView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var dueDateValueView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var dueDateLabelView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    var activeValueView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    var activeLabelView: UILabel = {
        var textView = UILabel();
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier);
        self.addSubview(idValueView);
        self.addSubview(idLabelView);
        
        self.addSubview(numberLabelView);
        self.addSubview(numberValueView);
        
        self.addSubview(cardholderNameLabelView);
        self.addSubview(cardholderNameValueView);
        
        self.addSubview(dueDateLabelView);
        self.addSubview(dueDateValueView);
        
        self.addSubview(activeLabelView);
        self.addSubview(activeValueView);
        
        idLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        idLabelView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        idLabelView.topAnchor.constraint(equalTo:self.topAnchor, constant:10).isActive = true
        
        idValueView.leftAnchor.constraint(equalTo: self.idLabelView.rightAnchor).isActive = true;
        idValueView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        idValueView.topAnchor.constraint(equalTo: self.topAnchor, constant:10).isActive = true;
        
        
        numberLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        numberLabelView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        numberLabelView.topAnchor.constraint(equalTo:self.topAnchor, constant:30).isActive = true;
        
        numberValueView.leftAnchor.constraint(equalTo: self.numberLabelView.rightAnchor).isActive = true;
        numberValueView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        numberValueView.topAnchor.constraint(equalTo:self.topAnchor, constant:30).isActive = true
        
        
        cardholderNameLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        cardholderNameLabelView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        cardholderNameLabelView.topAnchor.constraint(equalTo:self.topAnchor, constant:50).isActive = true;
        
        cardholderNameValueView.leftAnchor.constraint(equalTo: self.numberLabelView.rightAnchor).isActive = true;
        cardholderNameValueView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        cardholderNameValueView.topAnchor.constraint(equalTo:self.topAnchor, constant:50).isActive = true
        
        
        dueDateLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        dueDateLabelView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        dueDateLabelView.topAnchor.constraint(equalTo:self.topAnchor, constant:70).isActive = true;
        
        dueDateValueView.leftAnchor.constraint(equalTo: self.dueDateLabelView.rightAnchor).isActive = true;
        dueDateValueView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        dueDateValueView.topAnchor.constraint(equalTo:self.topAnchor, constant:70).isActive = true
        
        
        activeLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        activeLabelView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true;
        activeLabelView.topAnchor.constraint(equalTo:self.topAnchor, constant:90).isActive = true;
        
        activeValueView.leftAnchor.constraint(equalTo: self.activeLabelView.rightAnchor).isActive = true;
        activeValueView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
        activeValueView.topAnchor.constraint(equalTo:self.topAnchor, constant:90).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        idLabelView.text = "id: "
        if let id = id {
            idValueView.text = id;
        }
        
        numberLabelView.text = "number: "
        if let number = number {
            numberValueView.text = number;
        }
        
        cardholderNameLabelView.text = "cardholderName: "
        if let cardholderName = cardholderName {
            cardholderNameValueView.text = cardholderName;
        }
        
        dueDateLabelView.text = "dueDate: "
        if let dueDate = dueDate {
            dueDateValueView.text = dueDate;
        }
        
        activeLabelView.text = "active: "
        if let active = active {
            activeValueView.text = String(active);
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
}
