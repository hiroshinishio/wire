// Code generated by Wire protocol buffer compiler, do not edit.
// Source: squareup.protos.kotlin.unknownfields.VersionOne in unknown_fields.proto
import Foundation
import Wire

public struct VersionOne : Equatable {

    public var i: Int32?
    public var obj: NestedVersionOne?
    public var en: EnumVersionOne?
    public var unknownFields: Data = .init()

    public init(
        i: Int32? = nil,
        obj: NestedVersionOne? = nil,
        en: EnumVersionOne? = nil
    ) {
        self.i = i
        self.obj = obj
        self.en = en
    }

}

extension VersionOne : Proto2Codable {
    public init(from reader: ProtoReader) throws {
        var i: Int32? = nil
        var obj: NestedVersionOne? = nil
        var en: EnumVersionOne? = nil

        let unknownFields = try reader.forEachTag { tag in
            switch tag {
                case 1: i = try reader.decode(Int32.self)
                case 7: obj = try reader.decode(NestedVersionOne.self)
                case 8: en = try reader.decode(EnumVersionOne.self)
                default: try reader.readUnknownField(tag: tag)
            }
        }

        self.i = i
        self.obj = obj
        self.en = en
        self.unknownFields = unknownFields
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: i)
        try writer.encode(tag: 7, value: obj)
        try writer.encode(tag: 8, value: en)
        try writer.writeUnknownFields(unknownFields)
    }
}

extension VersionOne : Codable {
    public enum CodingKeys : String, CodingKey {

        case i
        case obj
        case en

    }
}
