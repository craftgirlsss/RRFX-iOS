func isValidPassword(_ password: String) -> Bool {
    let lengthRequirement = password.count >= 8
    let capitalLetter = password.range(of: "[A-Z]", options: .regularExpression) != nil
    let lowercaseLetter = password.range(of: "[a-z]", options: .regularExpression) != nil
    let digit = password.range(of: "[0-9]", options: .regularExpression) != nil
    let specialCharacter = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
    
    return lengthRequirement && capitalLetter && lowercaseLetter && digit && specialCharacter
}

