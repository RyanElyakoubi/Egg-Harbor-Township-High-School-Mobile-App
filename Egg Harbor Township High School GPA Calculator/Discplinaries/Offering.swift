import Foundation


// MARK: - Offering
struct Offering: Codable {
    let title, grades, preRequisite, offeringDescription: String

    enum CodingKeys: String, CodingKey {
        case title, grades
        case preRequisite = "pre-requisite"
        case offeringDescription = "description"
    }
}
