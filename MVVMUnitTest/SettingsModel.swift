//
//  SettingsModel.swift
//  MVVMDemo
//
//  Created by AJAY on 01/06/21.
//  Copyright © 2021 Individual. All rights reserved.
//

import Foundation

// MARK: - SettingsModel
struct SettingsModel: Codable {
    let status: String
    let code: Int
    let message: String
    let data: [SettingsData]
}

// MARK: - Datum
struct SettingsData: Codable {
    let id: Int
    let accessKey: String
    let value: String
    let createdAt: CreatedAt
    let updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case accessKey = "access_key"
        case value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum CreatedAt: String, Codable {
    case the20210611T074721000Z = "2021-06-11T07:47:21.000Z"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
