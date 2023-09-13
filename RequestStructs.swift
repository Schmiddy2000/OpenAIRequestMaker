//
//  RequestStructs.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import Foundation

struct ChatCompletionRequest: Encodable {
    let model: String
    let messages: [Message]
    let functions: [FunctionDescription]?
    let function_call: [String: String]?
    let temperature: Float?
    
    init(model: String, prompt: String, functions: [FunctionDescription]? = nil, function_call: [String: String]? = nil, temperature: Float? = nil) {
        self.model = model
        self.messages = [Message(role: "user", content: prompt)]
        self.functions = functions
        self.function_call = function_call
        self.temperature = temperature
    }
}
