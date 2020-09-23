import Foundation
import UIKit
import Firebase

class ConfigController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        let baseUrlDafaults = AppConfig.get(key: AppConfig.BASE_URL_KEY);
        let authTokenDafaults = AppConfig.get(key: AppConfig.AUTH_TOKEN_KEY);
        let notifyTokenDafaults = AppConfig.get(key: AppConfig.NOTIFY_TOKEN_KEY);
        
        if !baseUrlDafaults.isEmpty{
            baseURL.text = baseUrlDafaults;
        }
        if !authTokenDafaults.isEmpty{
            authToken.text = authTokenDafaults;
        }
        if !notifyTokenDafaults.isEmpty{
            notifyToken.text = notifyTokenDafaults;
        }
    }
    
    @IBOutlet weak var baseURL: UITextField!
    @IBOutlet weak var clientID: UITextField!
    @IBOutlet weak var clientSecret: UITextField!
    @IBOutlet weak var authToken: UITextField!
    @IBOutlet weak var notifyToken: UITextField!
    
    @IBAction func getAuthToken(_ sender: Any) {
        guard let clientID = self.clientID.text,
            let clientSecret = self.clientSecret.text else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return;
        }
        requestToken(clientId: clientID, clientSecret: clientSecret);
    }
    
    @IBAction func getNotifyToken(_ sender: Any) {
        let token = Messaging.messaging().fcmToken;
        self.notifyToken.text = token;
    }
    
    @IBAction func saveConfig(_ sender: Any) {
        guard let baseurl = self.baseURL.text,
            let authToken = self.authToken.text,
            let notifyToken = self.notifyToken.text else {
                let alert = Utils.getAlert(title: "Erro", message: "Campos obrigatórios não preenchidos");
                present(alert, animated: true, completion: nil);
                return;
        }
        AppConfig.set(value: baseurl, key: AppConfig.BASE_URL_KEY);
        AppConfig.set(value: authToken, key: AppConfig.AUTH_TOKEN_KEY);
        AppConfig.set(value: notifyToken, key: AppConfig.NOTIFY_TOKEN_KEY);
        self.dismiss(animated: true);
    }

    func requestToken(clientId:String, clientSecret:String){
        
        let url = URL(string: "http://177.43.232.243:9093/auth/realms/wallet/protocol/openid-connect/token") ;

        let data : Data = "client_id=\(clientId)&client_secret=\(clientSecret)&grant_type=client_credentials".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: url!);
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = data

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                //Houve resposta do servidor
                if let data = data {
                    if let response = response as? HTTPURLResponse{
                        //Resposta de Sucesso
                        if((200...299) ~= response.statusCode){
                            let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any];
                            let token = response!["access_token"]! as? String;
                            DispatchQueue.main.async {
                                let alert = Utils.getAlert(title: "Sucesso", message: "Token obtido");
                                self.present(alert, animated: true, completion: nil);
                                self.authToken.text = token;
                            }
                        }else{
                            DispatchQueue.main.async {
                                let alert = Utils.getAlert(title: "Erro", message: "Não foi possível obter o token");
                                self.present(alert, animated: true, completion: nil);
                            }
                        }
                    }
                }
                else {
                    //Não houve resposta
                    print("Não houve resposta")
                }
            } catch let error as NSError {
                //Houve um erro na comunicao com o servidor
                print(error)
                print("Houve um erro na comunicao com o servidor");
            }
        }
        //Aciona a tarefa
        task.resume();
    }
}
