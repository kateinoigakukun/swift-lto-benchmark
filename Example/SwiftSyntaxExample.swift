import SwiftSyntax
import Foundation

/// AddOneToIntegerLiterals will visit each token in the Syntax tree, and
/// (if it is an integer literal token) add 1 to the integer and return the
/// new integer literal token.
class AddOneToIntegerLiterals: SyntaxRewriter {
  override func visit(_ token: TokenSyntax) -> Syntax {
    // Only transform integer literals.
    guard case .integerLiteral(let text) = token.tokenKind else {
      return Syntax(token)
    }

    // Remove underscores from the original text.
    let integerText = String(text.filter { ("0"..."9").contains($0) })

    // Parse out the integer.
    let int = Int(integerText)!

    // Create a new integer literal token with `int + 1` as its text.
    let newIntegerLiteralToken = token.withKind(.integerLiteral("\(int + 1)"))
    
    // Return the new integer literal.
    return Syntax(newIntegerLiteralToken)
  }
}

let source = """
let x = 2
let y = 3_000
"""
let sourceFile = try SyntaxParser.parse(source: source)
let incremented = AddOneToIntegerLiterals().visit(sourceFile)
print(incremented)
