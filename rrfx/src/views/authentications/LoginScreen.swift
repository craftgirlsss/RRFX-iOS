//
//  LoginScreen.swift
//  rrfx
//
//  Created by XFCE on 07/08/25.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var isShowingLogin: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Tombol Kembali
            // ...

            // Judul dan Deskripsi
            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(AppColors.secondaryColor)
            Text("back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.bottom, 15.0)

            Text("Lihat pergerakan harga pasar global secara langsung, dengan chart interaktif dan analisis teknikal lengkap.")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 20.0)

            // Form Input
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email Address", text: .constant(""))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )

                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Password", text: .constant(""))
                    Image(systemName: "eye") // Ikon mata
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
        
            // Tombol "Forgot Password"
            HStack(alignment: .top){
                Button(action: {}) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(AppColors.secondaryColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }.padding()

            // Tombol "Sign in" dan "Continue with Google"
            Button(action: {
                isShowingLogin = false
            }) {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }.padding(.bottom)

            Button(action: {}) {
                HStack {
                    Image("icon-google") // Ganti dengan aset gambar Google Anda
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Google")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.top, 5)

            Spacer()

            // Teks "Register Now"
            HStack {
                Spacer()
                Text("Not Have Account?")
                    .foregroundColor(Color.gray)
                Button(action: {}) {
                    Text("Register Now")
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}
