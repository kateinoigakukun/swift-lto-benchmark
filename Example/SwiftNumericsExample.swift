@_silgen_name("_runBenchmark")
public func runBenchmark(_ fn: (Int) -> Void) -> Void

import ComplexModule

func scaleAndRotate<T>(_ z: Complex<T>) -> Complex<T> {
  z * Complex(0, 2)
}

@inline(never)
func blackhole<T>(_: T) {}

runBenchmark { n in
    for _ in 0 ..< n {
        blackhole(scaleAndRotate(Complex(1.0, 1.0)))
    }
}
