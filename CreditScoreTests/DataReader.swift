//
//  DataReader.swift
//  CreditScoreTests
//
//  Created by Magnus Holm on 23/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

final class DataReader {
    
    final class Dummy {}
    
    func readFile(named name: String, ofType type: String) throws -> Data {
        let path = Bundle(for: Dummy.self).path(forResource: name, ofType: type)!
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}

