struct BaseResponse: Codable {
    let status: Bool
    let message: String
}

struct LoginResponse: Codable {
    let status: Bool
    let message: String
    let response: UserResponse
}

struct UserResponse: Codable {
    let access_token: String
    let refresh_token: String
    let expires_in: Int
    let personal_detail: PersonalDetail
}

struct PersonalDetail: Codable {
    let id: String
    let name: String
    let email: String
    let phone: String
    let gender: String
    let city: String?
    let country: String
    let address: String
    let zip: String
    let tgl_lahir: String
    let tmpt_lahir: String
    let type_id: String?
    let id_number: String?
    let url_photo: String
    let status: String
    let ver: String
}

