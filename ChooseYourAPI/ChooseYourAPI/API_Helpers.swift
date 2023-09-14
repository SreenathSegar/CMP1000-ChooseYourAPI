//
//  API_Helpers.swift
//  ChooseYourAPI
//
//  Created by Sreenath Segar on 2023-09-14.
//

import Foundation
enum API_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
}
class JSONPlaceholderAPI_Helper{
    static private let baseURL_String = "https://jsonplaceholder.typicode.com/users/1"
    
    static public func fetch() async throws -> Any{
        guard
            let url = URL(string: baseURL_String)
        else {throw API_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            print(jsonObject)
            return jsonObject
        } catch {
            throw error
        }
    }
}
