import SwiftUI

struct PasswordRuleItem: View {
    var text: String
    var passed: Bool

    var body: some View {
        HStack {
            Image(systemName: passed ? "checkmark.circle.fill" : "xmark.circle")
                .foregroundColor(passed ? .green : .gray)
            Text(text)
        }
    }
}
