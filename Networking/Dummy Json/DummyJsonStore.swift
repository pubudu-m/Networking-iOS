//
//  DummyJsonStore.swift
//  Networking
//
//  Created by Pubudu Mihiranga on 2024-03-11.
//

import Foundation

struct DummyJsonStore: NetworkingClient {
    func getUser() async -> Result<UserDTO, NetworkError> {
        return await sendRequest(apiTarget: DummyJsonAPITarget.getUser, responseModel: UserDTO.self)
    }
}
