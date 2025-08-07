//
//  RegisterScreen.swift
//  rrfx
//
//  Created by XFCE on 07/08/25.
//

import SwiftUI

struct RegisterScreen: View {
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @State private var phoneNumber: String = ""
    @State private var otpCode: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var isAgreed: Bool = false
    @State private var isOTPSent: Bool = false
    
    
    var isFormValid: Bool {
        return !fullName.isEmpty &&
           !emailAddress.isEmpty &&
           !phoneNumber.isEmpty &&
           !otpCode.isEmpty &&
           !password.isEmpty &&
           !repeatPassword.isEmpty &&
           isAgreed
    }
    
    var isEmailValid: Bool? {
        if emailAddress.isEmpty {
            return nil // Belum divalidasi
        }
        return isValidEmail(emailAddress)
    }
    
    // Properti state untuk mengontrol visibilitas password.
    @State private var isPasswordVisible: Bool = false
    @State private var isRepeatPasswordVisible: Bool = false
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    // MARK: - Top Navigation
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.secondaryColor)
                    Text("back!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)

                    Text("Lihat pergerakan harga pasar global secara langsung, dengan chart interaktif dan analisis teknikal lengkap.")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 20.0)

                    // MARK: - Input Fields
                    Group {
                        Text("Full Name")
                            .font(.headline)
                            .padding(.bottom, 5)
                        InputTextField(placeholder: "Full Name", text: $fullName, iconName: "person")
                            .padding(.bottom, 10.0)

                        Text("Email Address")
                            .font(.headline)
                            .padding(.bottom, 5)
                        ValidatedInputTextField(
                            placeholder: "name@email.com",
                            text: $emailAddress,
                            iconName: "envelope",
                            isValid: isEmailValid
                        )
                        .padding(.bottom, 10.0)
                        
                        Text("Phone Number")
                            .font(.headline)
                            .padding(.bottom, 5)
                        PhoneInputView(phoneNumber: $phoneNumber, isOTPSent: $isOTPSent)
                            .padding(.bottom, 10.0)

                        if isOTPSent {
                            Text("OTP Code")
                                .font(.headline)
                                .padding(.bottom, 5)
                            OTPInputView(otpCode: $otpCode)
                                .padding(.bottom, 10.0)
                        }
                        
                        Text("Password")
                            .font(.headline)
                            .padding(.bottom, 5)
                        SecureInputView(placeholder: "Create Password", text: $password, iconName: "lock", isVisible: $isPasswordVisible)
                            .padding(.bottom, 10.0)
                        
                        Text("Repeat Password")
                            .font(.headline)
                            .padding(.bottom, 5)
                        SecureInputView(placeholder: "Repeat Password", text: $repeatPassword, iconName: "lock", isVisible: $isRepeatPasswordVisible)
                            .padding(.bottom, 10.0)
                    }
                    
                    // MARK: - Agreement Checkbox
                    HStack(alignment: .top) {
                        Button(action: {
                            isAgreed.toggle()
                        }) {
                            Image(systemName: isAgreed ? "checkmark.square.fill" : "square")
                                .foregroundColor(isAgreed ? .blue : .gray)
                        }
                        
                        Text("Dengan mendaftar, Anda menyetujui Kebijakan Privasi dan Syarat & Ketentuan aplikasi RRFX.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 10)

                    Spacer()
                    
                    // MARK: - Next Button
                    Button(action: {
                        // TODO: Aksi untuk tombol 'Next' di sini
                        print("Next button tapped!")
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? AppColors.primaryColor : Color.gray)
                            .cornerRadius(10)
                    }
                    .disabled(!isFormValid)
                }
                .padding()
                .navigationBarHidden(true) // Sembunyikan navigasi default
            }
        }
    }
}

// Komponen untuk TextField umum
struct InputTextField: View {
    let placeholder: String
    @Binding var text: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
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

// Komponen untuk input nomor telepon dengan tombol OTP
struct PhoneInputView: View {
    @Binding var phoneNumber: String
    @Binding var isOTPSent: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            HStack {
                // Ikon bendera dan kode negara
                Text("🇮🇩 +62")
                    .foregroundColor(.gray)
                TextField("Phone Number", text: $phoneNumber)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            
            Button(action: {
                isOTPSent = !isOTPSent
            }) {
                Text("Send OTP")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(AppColors.primaryColor)
                    .cornerRadius(10)
            }
        }
    }
}

// Komponen untuk input OTP dengan counter karakter
struct OTPInputView: View {
    @Binding var otpCode: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            InputTextField(placeholder: "OTP Code", text: $otpCode, iconName: "number")
            
            Text("\(otpCode.count)/13") // Contoh counter karakter
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.trailing, 16)
        }
    }
}

// Komponen untuk input password yang bisa disembunyikan/ditampilkan
struct SecureInputView: View {
    let placeholder: String
    @Binding var text: String
    let iconName: String
    @Binding var isVisible: Bool
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            
            if isVisible {
                TextField(placeholder, text: $text)
            } else {
                SecureField(placeholder, text: $text)
            }
            
            Button(action: {
                isVisible.toggle()
            }) {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
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

#Preview {
    RegisterScreen()
}
