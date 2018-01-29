import Foundation
import ObjectMapper

public class FloatTransform: TransformType {
    public typealias Object = Float
    public typealias JSON = String

    public init() {}

    public func transformFromJSON(_ value: Any?) -> Float? {
        guard let value = value as? NSString else { return nil }
        return value.floatValue
    }

    public func transformToJSON(_ value: Float?) -> String? {
        guard let value = value else { return nil }
        return value.description
    }
}
