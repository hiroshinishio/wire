// Code generated by Wire protocol buffer compiler, do not edit.
// Source: squareup.protos3.kotlin.contains_duration.ContainsDuration in contains_duration.proto
import Foundation
import Wire

public struct ContainsDuration {

    @Defaulted(defaultValue: Duration())
    public var duration: Duration?
    public var unknownFields: Foundation.Data = .init()

    public init(configure: (inout Self) -> Void = { _ in }) {
        configure(&self)
    }

}

#if WIRE_INCLUDE_MEMBERWISE_INITIALIZER
extension ContainsDuration {

    @_disfavoredOverload
    @available(*, deprecated)
    public init(duration: Duration? = nil) {
        _duration.wrappedValue = duration
    }

}
#endif

#if !WIRE_REMOVE_EQUATABLE
extension ContainsDuration : Equatable {
}
#endif

#if !WIRE_REMOVE_HASHABLE
extension ContainsDuration : Hashable {
}
#endif

#if swift(>=5.5)
extension ContainsDuration : Sendable {
}
#endif

extension ContainsDuration : ProtoMessage {

    public static func protoMessageTypeURL() -> Swift.String {
        return "type.googleapis.com/squareup.protos3.kotlin.contains_duration.ContainsDuration"
    }

}

extension ContainsDuration : Proto3Codable {

    public init(from reader: Wire.ProtoReader) throws {
        var duration: Duration? = nil

        let token = try reader.beginMessage()
        while let tag = try reader.nextTag(token: token) {
            switch tag {
            case 1: duration = try reader.decode(Duration.self)
            default: try reader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try reader.endMessage(token: token)

        _duration.wrappedValue = duration
    }

    public func encode(to writer: Wire.ProtoWriter) throws {
        try writer.encode(tag: 1, value: self.duration)
        try writer.writeUnknownFields(unknownFields)
    }

}

#if !WIRE_REMOVE_CODABLE
extension ContainsDuration : Codable {

    public init(from decoder: Swift.Decoder) throws {
        let container = try decoder.container(keyedBy: Wire.StringLiteralCodingKeys.self)
        _duration.wrappedValue = try container.decodeIfPresent(Duration.self, forKey: "duration")
    }

    public func encode(to encoder: Swift.Encoder) throws {
        var container = encoder.container(keyedBy: Wire.StringLiteralCodingKeys.self)

        try container.encodeIfPresent(self.duration, forKey: "duration")
    }

}
#endif
