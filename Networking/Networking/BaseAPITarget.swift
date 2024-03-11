//
//  BaseAPITarget.swift
//  Networking
//
//  Created by Pubudu Mihiranga on 2024-03-04.
//

import Foundation

protocol BaseAPITarget {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
    var cachePolicy: URLCachePolicy { get }
    var stubbingBehavior: StubBehavior { get }
    var sampleData: String { get }
}

extension BaseAPITarget {
    var scheme: String {
        return "https"
    }
    
    /*
     how to set host based on different envs like dev, QA and prod
     */
    var host: String {
        return "dummyjson.com"
    }
}
