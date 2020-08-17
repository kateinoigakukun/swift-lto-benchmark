import Foundation

extension UInt64 {
  var microseconds: Double { return Double(self) / 1000 }
}

final class Timer {
  #if canImport(Darwin)
  typealias TimeT = UInt64

  var info = mach_timebase_info_data_t(numer: 0, denom: 0)

  init() {
    mach_timebase_info(&info)
  }

  func getTime() -> TimeT {
    return mach_absolute_time()
  }

  func diffTimeInNanoSeconds(from start: TimeT, to end: TimeT) -> UInt64 {
    let elapsed = end - start
    return elapsed * UInt64(info.numer) / UInt64(info.denom)
  }
  #else
  typealias TimeT = timespec

  func getTime() -> TimeT {
    var ts = timespec(tv_sec: 0, tv_nsec: 0)
    clock_gettime(CLOCK_REALTIME, &ts)
    return ts
  }

  func diffTimeInNanoSeconds(from start: TimeT, to end: TimeT) -> UInt64 {
    let oneSecond = 1_000_000_000 // ns
    var elapsed = timespec(tv_sec: 0, tv_nsec: 0)
    if end.tv_nsec - start.tv_nsec < 0 {
      elapsed.tv_sec = end.tv_sec - start.tv_sec - 1
      elapsed.tv_nsec = end.tv_nsec - start.tv_nsec + oneSecond
    } else {
      elapsed.tv_sec = end.tv_sec - start.tv_sec
      elapsed.tv_nsec = end.tv_nsec - start.tv_nsec
    }
    return UInt64(elapsed.tv_sec) * UInt64(oneSecond) + UInt64(elapsed.tv_nsec)
  }
  #endif
}

func resourceUsage() -> rusage {
  var result = rusage()
  #if canImport(Darwin)
  let status = getrusage(RUSAGE_SELF, &result)
  #else
  let status = getrusage(RUSAGE_SELF.rawValue, &result)
  #endif
  assert(status == 0)
  return result
}

func measureSample(_ iterations: Int, _ fn: (Int) -> Void) -> Double {
  let timer = Timer()
  let start = timer.getTime()
  fn(iterations)
  let end = timer.getTime()
  let sampleTime = timer.diffTimeInNanoSeconds(from: start, to: end)
  return sampleTime.microseconds / Double(iterations)
}

func measure(samples: Int, iterations: Int, _ fn: (Int) -> Void) -> BenchmarkResult {
  let baseline = resourceUsage()
  var samplesData: [Double] = []
  for _ in 0 ..< samples {
    samplesData.append(measureSample(iterations, fn))
  }
  let target = resourceUsage()
  return BenchmarkResult(
    samples: samplesData,
    maxRSS: target.ru_maxrss - baseline.ru_maxrss
  )
}

@_silgen_name("_runBenchmark")
public func runBenchmark(_ fn: (Int) -> Void) -> Void {
  func getenvInt(_ name: String) -> Int? {
    getenv(name).flatMap { Int(String(cString: $0)) }
  }
  let result = measure(
    samples: getenvInt("SWIFT_LTO_BENCH_SAMPLES") ?? 1000,
    iterations: getenvInt("SWIFT_LTO_BENCH_ITERATIONS") ?? 100,
    fn
  )
  let encoder = JSONEncoder()
  let json = try! encoder.encode(result)
  print(String(data: json, encoding: .utf8)!)
}
