//
//  FunctionDescriptions.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import Foundation

// Structures needed to create the function description needed for the function calling in an api query

struct FunctionDescription: Encodable {
    let name: String
    let description: String
    let parameters: FunctionDescriptionParameters
}

struct FunctionDescriptionParameters: Encodable {
    let type: String
    let properties: [String: FunctionDescriptionParameterProperty]
    let required: [String]
}

struct FunctionDescriptionParameterProperty: Encodable {
    let type: String
    let description: String
}

// Here is an example:

//  let commandProperty = FunctionDescriptionParameterProperty(type: "string", description: "The bash command to execute. E.g., 'touch myfile.txt' to create a new file or 'mkdir mydir' to create a directory.")
//
//  let parameters = FunctionDescriptionParameters(type: "object", properties: ["command": commandProperty], required: ["command"])
//
//  let functionDescription = FunctionDescription(name: "execute_shell_command", description: "Executes a given bash shell command and returns its output. This function expects simple bash commands like 'touch', 'mkdir', 'echo', etc. For instance, to create a file, it should be 'touch filename.ext'.", parameters: parameters)
