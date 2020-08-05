@_silgen_name("_runBenchmark")
public func runBenchmark(_ fn: (Int) -> Void) -> Void

runBenchmark { n in
    for _ in 0 ..< n {
        var output = ""
        print("Hello", to: &output)
        _ = output
    }
}
