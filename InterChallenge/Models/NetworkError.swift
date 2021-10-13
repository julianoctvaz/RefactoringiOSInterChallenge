//
//  NetworkError.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import Foundation

enum NetworkError: String, Error {
    case invalidResponse = "Invalid response from the server or was unable to complete your request. Please check your internet connection and try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case failedToDecodeResponse = "Unable to decode the response. Please try again."
}
