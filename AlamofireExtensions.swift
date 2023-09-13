//
//  AlamofireExtensions.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import Foundation
import Alamofire

extension DataRequest {
    func responseData() async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            self.response { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data!)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
