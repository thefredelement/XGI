//
//  main.swift
//  XGI
//
//  Created by Fred Faust on 11/12/17.
//  Copyright © 2017 Fred Faust. All rights reserved.
//

import Foundation


func main(_ arguments: [String]) -> Int32 {
    
    let env = ProcessInfo.processInfo.environment
    env.forEach {
        print("env var is: \($0.key) : \($0.value)")
    }
    
    
    return EXIT_SUCCESS; //
}

_ = main(CommandLine.arguments)
