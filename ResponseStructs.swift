//
//  ResponseStructs.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import Foundation

// Represents the top-level response
struct ChatCompletionResponse: Decodable {
    let id: String
    let choices: [Choice]
    let usage: Usage
}

// Represents the "choices" array items
struct Choice: Decodable {
    let index: Int
    let message: Message
    let finish_reason: FinishReason
}

// Represents the "message" dictionary
struct Message: Codable {
    let role: String
    let content: String?
    var function_call: FunctionCall? = nil
}

// Represents the "function_call" dictionary (only present in the function call response)
struct FunctionCall: Codable {
    let name: String
    let arguments: String
}

// Represents the "usage" dictionary
struct Usage: Decodable {
    let prompt_tokens: Int
    let completion_tokens: Int
    let total_tokens: Int
}

enum FinishReason: String, Decodable {
    case stop
    case functionCall = "function_call"
    case other
}
