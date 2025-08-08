//
//  ForgotPassword.swift
//  rrfx
//
//  Created by XFCE on 08/08/25.
//

import SwiftUI

struct ForgotPassword: View {
    @State var emailAddress: String = ""
    
    var isEmailValid: Bool? {
        if emailAddress.isEmpty {
            return nil // Belum divalidasi
        }
        return isValidEmail(emailAddress)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Forgot")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(AppColors.secondaryColor)
            Text("password!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.bottom, 15.0)

            Text("Inputkan alamat Email yang telah didaftarkan sebelumnya, sistem akan mengirimkan kode password baru ke alamat email terkait")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 20.0)
            
            Group {
                Text("Email Address")
                    .font(.headline)
                    .padding(.bottom, 5)
                EmailTextField(
                    placeholder: "name@email.com",
                    text: $emailAddress,
                    iconName: "envelope",
                    isValid: isEmailValid
                )
                .padding(.bottom, 10.0)
            }
            
            Spacer()
            
            Button(action: {
            }) {
                Text("Reset Password")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }.padding(.bottom)
        }
        .padding(.horizontal, 16.0)
        .padding(.vertical, 20)
    }
}

#Preview {
    ForgotPassword()
}
