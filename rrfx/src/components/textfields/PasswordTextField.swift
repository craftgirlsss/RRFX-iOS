import SwiftUI

struct PasswordTextField: View {
    let placeholder: String
    @Binding var password: String
    @Binding var isVisible: Bool
    
    var isValid: Bool? {
        if password.isEmpty { return nil }
        return isValidPassword(password)
    }
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.gray)
            
            if isVisible {
                TextField(placeholder, text: $password)
            } else {
                SecureField(placeholder, text: $password)
            }
            
            Button(action: {
                withAnimation {
                    isVisible.toggle()
                }
            }) {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
            
            if let valid = isValid {
                withAnimation {
                    Image(systemName: valid ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(valid ? .green : .red)
                        .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        
    }
}
