//
//  XCSAPI.swift
//  XGI
//
//  Created by Fred Faust on 11/12/17.
//  Copyright © 2017 Fred Faust. All rights reserved.
//

import Foundation

private enum HTTPMethod: String {
    
    case DELETE
    case GET
    case PATCH
    case POST
}

private enum Endpoint {
    
    case bots
    case integration
    
    var url: URL? {
        // TODO: - Return url for each Xcode Server Endpoint
        return nil
    }
}


struct XCSAPI {
    
    
}
