precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication
public func |> <A, B>(_ a: A, _ f: @escaping (A) -> B) -> B {
    return f(a)
}

precedencegroup SingleComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator <>: SingleComposition
public func <> <A: AnyObject>(_ f: @escaping (A) -> Void,
                              _ g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

prefix operator ^
public prefix func ^ <Root, Value>(
    _ kp: ReferenceWritableKeyPath<Root, Value>
    )
    -> (@escaping (inout Value) -> Void)
    -> (Root) -> Void {
        return { update in
            return { root in
                update(&root[keyPath: kp])
            }
        }
}

