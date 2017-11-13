//
//  XCSAPI.swift
//  XGI
//
//  Created by Fred Faust on 11/12/17.
//  Copyright © 2017 Fred Faust. All rights reserved.
//

import Foundation


private enum EndpointURLError: Error {
    
    case couldNotMakeURL
}

private enum HTTPMethod: String {
    
    case DELETE
    case GET
    case PATCH
    case POST
}

private enum Endpoint {
    
    private var base: URL? {
        return URL(string: "https://localhost:20343/api")
    }
    
    case bots
    case integration
    
    func makeIntegrationPostURL(for bot: String) throws -> URL {
        // api/bots/6f0faeb1cc4c55e174cac5ff8100f13b/integrations
        let rawURL = "/bots/\(bot)/integrations"
        guard let url = base?.appendingPathComponent(rawURL) else {
            throw EndpointURLError.couldNotMakeURL
        }
        return url
    }
}


struct XCSAPI {
    
    
}
