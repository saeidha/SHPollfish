//
//  ViewModel.swift
//  SHPollfish
//
//  Created by Saeid Hosseinabadi on 2/9/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import Foundation
import AdSupport

public class SHViewModel{
    
    // --VARIABLES
    // Public
    public var model: SHPollfishModel
    public let url = URL(string: "https://www.pollfish.com/")
    public var firstParam: String{
        return model.param1
    }
    public var secParam: String{
        return model.param2
    }
    public var thirdParam: String{
        return model.param3
    }
    public var forthParam: String{
        return model.param4
    }
    public var fifthParam: String{
        return model.param5
    }
    public var myIDFA: String?{
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            // Set the IDFA
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }else{
            return nil}
    }
    // Private
    
    // --FUNCTIONS
    
    // init
    public init(m: SHPollfishModel = SHPollfishModel(param1: "Sample",
    param2: "Sample",
    param3: "Sample",
    param4: "Sample",
    param5: "Sample")) {
        
        model = m
    } 
}
