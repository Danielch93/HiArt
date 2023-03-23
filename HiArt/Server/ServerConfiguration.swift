//
//  ServerConfiguration.swift
//  HiArt
//
//  Created by Daniel Charry on 22/03/23.
//

import Foundation

enum BaseUrl: String {
    case DEBUG = "http://127.0.0.1:4000/"
    case DEV = "https://hiart-dev.com"
    case RELEASE = "https://hiart-release.com"
    case PROD = "https://hiart-prod.com"
}

class ServerConfiguration {
    static let shared = ServerConfiguration()
    var baseUrl: String?

    func setupServerConfig() {
        #if DEBUG
        debugServer()
        #elseif DEV
        baseUrl = BaseUrl.DEV.rawValue
        #elseif RELEASE
        baseUrl = BaseUrl.RELEASE.rawValue
        #elseif PROD
        baseUrl = BaseUrl.PROD.rawValue
        #endif
    }
}

extension ServerConfiguration {
    func debugServer() {
        baseUrl = BaseUrl.DEBUG.rawValue
        FirebaseManager.Connection()
    }
}
