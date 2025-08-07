import SwiftUI

struct ValidatedInputTextField: View {
    let placeholder: String
    @Binding var text: String
    let iconName: String
    var isValid: Bool? = nil // optional validasi
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
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
