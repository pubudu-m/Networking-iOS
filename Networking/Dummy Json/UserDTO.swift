//
//  UserDTO.swift
//  Networking
//
//  Created by Pubudu Mihiranga on 2024-03-11.
//

import Foundation

struct UserDTO: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case phone
        case avatarURL = "image"
    }
}
