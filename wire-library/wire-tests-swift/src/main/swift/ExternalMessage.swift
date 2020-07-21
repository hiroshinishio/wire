// Code generated by Wire protocol buffer compiler, do not edit.
// Source: squareup.protos.kotlin.simple.ExternalMessage in external_message.proto
import Foundation
import Wire

public struct ExternalMessage : Equatable {

    public var f: Float?
    public var unknownFields: Data = .init()

    public init(f: Float? = nil) {
        self.f = f
    }

}

extension ExternalMessage : Proto2Codable {
    public init(from reader: ProtoReader) throws {
        var f: Float? = nil

        let unknownFields = try reader.forEachTag { tag in
            switch tag {
                case 1: f = try reader.decode(Float.self)
                default: try reader.readUnknownField(tag: tag)
            }
        }

        self.f = f
        self.unknownFields = unknownFields
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: f)
        try writer.writeUnknownFields(unknownFields)
    }
}

extension ExternalMessage : Codable {
    public enum CodingKeys : String, CodingKey {

        case f

    }
}
