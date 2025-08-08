import Foundation

class AuthenticationController {
    static let shared = AuthenticationController()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        guard let url = URL(string: "https://yourapi.com/login") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Data kosong"])))
                }
                return
            }

            do {
                // Decode status dan message saja dulu
                let baseResponse = try JSONDecoder().decode(BaseResponse.self, from: data)
                
                if baseResponse.status {
                    // Jika sukses, decode full data
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(loginResponse))
                    }
                } else {
                    // Jika gagal, kirim error custom dari API
                    DispatchQueue.main.async {
                        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: baseResponse.message])))
                    }
                }

            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

        }.resume()
    }
}

