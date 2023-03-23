//
//  Analytics.swift
//  HiArt
//
//  Created by Daniel Charry on 11/03/23.
//

protocol FirebaseAnalyticsDelegate {

    func tagViewController(_ sectionName: String,
                           _ fileName: String,
                           _ action: String)

    func tagButton(_ sectionName: String,
                   _ elementName: String,
                   _ fileName: String,
                   _ action: String)

    func tagService(_ sectionName: String,
                    _ serviceName: String,
                    _ fileName: String,
                    _ action: String)

}
