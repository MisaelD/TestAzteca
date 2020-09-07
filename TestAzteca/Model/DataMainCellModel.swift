//
//  DataMainCellModel.swift
//  TestAzteca
//
//  Created by PorMientras on 04/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import Foundation

struct DataMainCellModel: Decodable {
    let imageName : String
    let title : String
    let numCell : Int
    let element: [Text]?
}

struct Text: Decodable {
    let text : String
}
