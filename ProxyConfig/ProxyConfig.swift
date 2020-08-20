import Foundation

let appgroup = "group.test.tun2socks-ios"

public let preferHandler = Handler.Shadowsocks
public let preferCipher = "aes-256-cfb"

public enum Handler: String {
    case Socks5 = "socks5"
    case Shadowsocks = "shadowsocks"
}

public let protocolList = ["socks5", "shadowsocks"]

public let cipherList = ["table", "plain", "none", "aes-128-cfb", "aes-128-cfb1", "aes-128-cfb8", "aes-128-cfb128", "aes-192-cfb", "aes-192-cfb1", "aes-192-cfb8", "aes-192-cfb128", "aes-256-cfb", "aes-256-cfb1", "aes-256-cfb8", "aes-256-cfb128", "aes-128-ctr", "aes-192-ctr", "aes-256-ctr", "rc4", "rc4-md5", "chacha20", "salsa20", "xsalsa20", "chacha20-ietf", "aes-128-gcm", "aes-256-gcm", "chacha20-ietf-poly1305", "xchacha20-ietf-poly1305"]

public class Config {
    public static func initializeConfig() {
        let proto = getStringConfig(name: ConfigKey.Proto.rawValue)
        if proto == nil {
            storeStringConfig(name: ConfigKey.Proto.rawValue, value: preferHandler.rawValue)
        }
        let cipher = getStringConfig(name: ConfigKey.Cipher.rawValue)
        if cipher == nil {
            storeStringConfig(name: ConfigKey.Cipher.rawValue, value: preferCipher)
        }
        let pass = getStringConfig(name: ConfigKey.Password.rawValue)
        if pass == nil {
            storeStringConfig(name: ConfigKey.Password.rawValue, value: "123456")
        }
        let host = getStringConfig(name: ConfigKey.Host.rawValue)
        if host == nil {
            storeStringConfig(name: ConfigKey.Host.rawValue, value: "1.2.3.4")
        }
        let port = getIntConfig(name: ConfigKey.Port.rawValue)
        if port == nil {
            storeIntConfig(name: ConfigKey.Port.rawValue, value: 1080)
        }
    }
}

public enum ConfigKey: String {
    case Proto = "Proto"
    case Host = "Host"
    case Port = "Port"
    case Password = "Password"
    case Cipher = "Cipher"
}

public func storeStringConfig(name: String, value: String) {
    UserDefaults.init(suiteName: appgroup)?.set(value, forKey: name)
}

public func storeIntConfig(name: String, value: Int) {
    UserDefaults.init(suiteName: appgroup)?.set(value, forKey: name)
}

public func getStringConfig(name: String) -> String? {
    if let value = UserDefaults.init(suiteName: appgroup)?.object(forKey: name) as? String {
        return value
    } else {
        return nil
    }
}

public func getIntConfig(name: String) -> Int? {
    if let value = UserDefaults.init(suiteName: appgroup)?.object(forKey: name) as? Int {
        return value
    } else {
        return 0
    }
}
