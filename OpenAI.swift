//
//  OpenAI.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import Foundation
import Alamofire

final class OpenAI {

    // Make sure to add your own api key here or use 'changeKey()' somewhen in your code
    private static var apiKey: String = ""
    
    private let chatCompletionURL: String = "https://api.openai.com/v1/chat/completions"
    
    func changeKey(newKey: String) {
        OpenAI.apiKey = newKey
    }
    
    func chatCompletion(prompt: String = "Hello, World!", model: String = "gpt-3.5-turbo", functions: [FunctionDescription]? = nil, function_call: [String: String]? = nil, temperature: Float? = nil) async throws -> (response: ChatCompletionResponse, responseType: FinishReason) {
                
        let requestBody = ChatCompletionRequest(model: model, prompt: prompt, functions: functions, function_call: function_call, temperature: temperature)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(OpenAI.apiKey)"
        ]
        
        let data = try await AF.request(chatCompletionURL, method: .post, parameters: requestBody, encoder: .json, headers: headers)
            .validate()
            .responseData()
        
        print("Data from API request: \(String(data: data, encoding: .utf8)!)")
                
        let decodedResponse = try JSONDecoder().decode(ChatCompletionResponse.self, from: data)
        
        let finishReason: FinishReason = decodedResponse.choices.first?.finish_reason ?? .other
                        
        return (decodedResponse, finishReason)
    }
    
    func getChatCompletionResults(prompt: String = "Hello, World!", model: String = "gpt-3.5-turbo", functions: [FunctionDescription]? = nil, function_call: [String: String]? = nil, temperature: Float? = nil) async -> String {
                
        do {
            let openAIResult = try await chatCompletion(prompt: prompt, model: model, functions: functions, function_call: function_call, temperature: temperature)
            
            var response: String
            
            switch openAIResult.responseType {
            case .stop:
                response = (openAIResult.response.choices.first?.message.content)!
            case .functionCall:
                response = (openAIResult.response.choices.first?.message.function_call?.arguments)!
            case .other:
                response = "Unnkown finish_reason"
            }
            
            return response
            
        } catch {
            print("Error in getChatCompletionResult: \(error.localizedDescription)")
            return error.localizedDescription
        }
    }
}
