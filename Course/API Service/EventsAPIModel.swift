import Foundation

// MARK: - Events

struct EventsApi: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    let id: Int
    let title, slug: String
    let images: [Imagei]
}

struct Imagei: Codable {
    let image: String
}
