@_silgen_name("_runBenchmark")
public func runBenchmark(_ fn: (Int) -> Void) -> Void
let editWords: [String] = [
  "woodshed",
  "lakism",
  "gastroperiodynia",
]

let alphabet = "abcdefghijklmnopqrstuvwxyz"
/// All edits that are one edit away from `word`
func edits(_ word: String) -> Set<String> {
  let splits = word.indices.map {
    (String(word[..<$0]), String(word[$0...]))
  }

  var result: Array<String> = []

  for (left, right) in splits {
    // drop a character
    result.append(left + right.dropFirst())

    // transpose two characters
    if let fst = right.first {
      let drop1 = right.dropFirst()
      if let snd = drop1.first {
        result.append(left + [snd,fst] + drop1.dropFirst())
      }
    }

    // replace each character with another
    for letter in alphabet {
      result.append(left + [letter] + right.dropFirst())
    }

    // insert rogue characters
    for letter in alphabet {
      result.append(left + [letter] + right)
    }
  }

  // have to map back to strings right at the end
  return Set(result)
}

runBenchmark { n in
  for _ in 0 ..< n {
    for word in editWords {
      _ = edits(word)
    }
  }
}
