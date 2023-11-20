//
//  Service+Push.swift
//  FeatherPush
//
//  Created by Tibor Bodecs on 20/11/2023.
//

import FeatherService
import Logging

public enum PushServiceID: ServiceID {

    /// default push service identifier
    case `default`
    
    /// custom push service identifier
    case custom(String)
    
    public var rawId: String {
        switch self {
        case .default:
            return "push-id"
        case .custom(let value):
            return "\(value)-push-id"
        }
    }
}

public extension ServiceRegistry {

    /// add a new push service using a context
    func add(
        _ contextFactoryBuilder: @autoclosure @escaping () -> ServiceContext,
        id: PushServiceID = .default
    ) async throws {
        try await add(.init { contextFactoryBuilder() }, id: id)
    }

    /// returns a push service by a given id
    func push(
        _ id: PushServiceID = .default,
        logger: Logger? = nil
    ) throws -> PushService {
        guard let push = try get(id, logger: logger) as? PushService else {
            fatalError("Push service not found, use `add` to register.")
        }
        return push
    }
}
