import Foundation

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
    return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
}
