import UIKit
import Foundation

public func mver<Root, Value>(
    _ kp: ReferenceWritableKeyPath<Root, Value>,
    _ f: @escaping (inout Value) -> Void
    )
    -> (Root) -> Void {
        let setter = ^kp
        return setter(f)
}

public func mut<Root, Value>(
    _ kp: ReferenceWritableKeyPath<Root, Value>,
    _ value: Value
    )
    -> (Root) -> Void {
        return mver(kp) { $0 = value }
}

public func mutate<Root: UIView, Value>(_ kp: ReferenceWritableKeyPath<Root, Value>, _ value: Value) -> (Root) -> () {
    return { root in
        root[keyPath: kp] = value
    }
}
