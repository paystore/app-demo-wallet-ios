import Foundation

class AppConfig {
    
    static let BASE_URL_KEY : String = "base_url";
    static let AUTH_TOKEN_KEY : String = "auth_token";
    static let NOTIFY_TOKEN_KEY : String = "notify_token";
    
    static func set(value: String, key:String){
        UserDefaults.standard.set(value, forKey: key);
    }
    
    static func get(key:String) -> String {
        return UserDefaults.standard.object(forKey: key) as? String ?? String();
    }
}

