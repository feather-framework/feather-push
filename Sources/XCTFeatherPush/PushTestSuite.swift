//
//  PushTestSuite.swift
//  XCTFeatherPush
//
//  Created by Tibor Bodecs on 17/11/2023.
//

import Foundation
import FeatherPush

public struct PushTestSuiteError: Error {

    public let function: String
    public let line: Int
    public let error: Error?

    init(
        function: String = #function,
        line: Int = #line,
        error: Error? = nil
    ) {
        self.function = function
        self.line = line
        self.error = error
    }
}

public struct PushTestSuite {

    let push: PushComponent

    public init(_ push: PushComponent) {
        self.push = push
    }

    public func testAll(
        from: String,
        to: String
    ) async throws {
        async let tests: [Void] = [
            testPlainText(from: from, to: to)
        ]
        do {
            _ = try await tests
        }
        catch let error as PushTestSuiteError {
            throw error
        }
        catch {
            throw PushTestSuiteError(error: error)
        }
    }
}

public extension PushTestSuite {

    func getAttachmentUrl() -> URL? {
        Bundle.module.url(forResource: "feather", withExtension: "png")
    }

    // MARK: - tests

    func testPlainText(
        from: String,
        to: String
    ) async throws {

    }

}
