/*
 * Copyright 2022 Block Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

/**
 * Wire implementation of the `google.protobuf.Any` type. The `Any` type wraps an arbitrary
 * protobuf message. Field of `Any` generated by Wire will be typed [AnyMessage]. [typeURL] is
 * used to identify the type of the message, defined as 'type.googleapis.com/full.type.name'.
 * [value] is the serialized representation of the wrapped message. The [pack] and [unpack] methods
 * are available to wrap and unwrap an `Any` message.
 *
 * Example
 * ```
 * let anyMessage = try AnyMessage.pack(person)
 * let person = try anyMessage.unpack(Person.self)
 * ```
 */
public struct AnyMessage {
    public let typeURL: String
    public let value: Data

    public init(typeURL: String, value: Data) {
        self.typeURL = typeURL
        self.value = value
    }

    public enum DecodingError: Swift.Error, Equatable {
        case typeURLMismatch
    }

    public func unpack<Output: ProtoMessage & ProtoDecodable>(
        _ type: Output.Type,
        decoder: ProtoDecoder = ProtoDecoder()
    ) throws -> Output {
        guard type.protoMessageTypeURL() == self.typeURL else {
            throw DecodingError.typeURLMismatch
        }

        return try decoder.decode(Output.self, from: self.value)
    }

    public static func pack<Input: ProtoMessage & ProtoEncodable>(
        _ input: Input
    ) throws -> AnyMessage {
        return AnyMessage(
            typeURL: type(of: input).protoMessageTypeURL(),
            value: try ProtoEncoder().encode(input)
        )
    }
}

#if !WIRE_REMOVE_EQUATABLE
extension AnyMessage: Equatable {
}
#endif

#if !WIRE_REMOVE_HASHABLE
extension AnyMessage: Hashable {
}
#endif

#if swift(>=5.5) && !WIRE_REMOVE_SENDABLE
extension AnyMessage: Sendable {
}
#endif

extension AnyMessage: Proto3Codable {
    public init(from reader: ProtoReader) throws {
        var typeURL: String?
        var value: Data?

        let token = try reader.beginMessage()
        while let tag = try reader.nextTag(token: token) {
            switch tag {
            case 1:
                typeURL = try reader.decode(String.self)
            case 2:
                value = try reader.decode(Data.self)
            default:
                try reader.readUnknownField(tag: tag)
            }
        }
        _ = try reader.endMessage(token: token)

        self.typeURL = typeURL ?? ""
        self.value = value ?? Data()
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: self.typeURL)
        try writer.encode(tag: 2, value: self.value)
    }
}

extension AnyMessage: ProtoMessage {
    public static func protoMessageTypeURL() -> String {
        return "google.protobuf.Any"
    }
}

#if !WIRE_REMOVE_CODABLE
extension AnyMessage: Codable {
    public enum CodingKeys: String, CodingKey {
        // TODO: Audit google.protobuf.Any JSON serialization strategy on both
        // Swift and Kotlin to ensure they conform to the spec.
        case typeURL = "@type"
        case value = "value"
    }
}
#endif
