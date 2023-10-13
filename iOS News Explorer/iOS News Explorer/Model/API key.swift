//
//  API key.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

import Security

class KeychainService {
    static func saveApiKey(apiKey: String, account: String, service: String) {
        let data = apiKey.data(using: .utf8)!
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        if status == errSecSuccess {
            print("API key saved successfully.")
        } else {
            print("Error saving API key: \(status)")
        }
    }

    static func getApiKey(account: String, service: String) -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }

    static func deleteApiKey(account: String, service: String) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]

        let status = SecItemDelete(query as CFDictionary)

        if status == errSecSuccess {
            print("API key deleted successfully.")
        } else {
            print("Error deleting API key: \(status)")
        }
    }
}

let apiKey = "your_api_key"
let account = "myAPIKey"
let service = "MyApp"
KeychainService.saveApiKey(apiKey: apiKey, account: account, service: service)
