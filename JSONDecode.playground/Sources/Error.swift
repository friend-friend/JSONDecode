import Foundation

public enum NetworkError: Error, LocalizedError {
    case connectionTimeout
    case serverError
    case networkUnavailable
    case inavalidURL
}
