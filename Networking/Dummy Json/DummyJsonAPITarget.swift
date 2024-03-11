//
//  DummyJsonAPITarget.swift
//  Networking
//
//  Created by Pubudu Mihiranga on 2024-03-11.
//

import Foundation

enum DummyJsonAPITarget {
    case getUser
}

extension DummyJsonAPITarget: BaseAPITarget {
    var path: String {
        switch self {
        case .getUser:
            return "/users/1"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .getUser:
            return nil
        }
    }
    
    var cachePolicy: URLCachePolicy {
        switch self {
        case .getUser:
            return .neverCache
        }
    }
    
    var stubbingBehavior: StubBehavior {
        switch self {
        case .getUser:
            return .never
        }
    }
    
    /*
     how to exclude sample data bundle from .ipa
     */
    var sampleData: String {
        switch self {
        case .getUser:
            return ""
        }
    }
}
