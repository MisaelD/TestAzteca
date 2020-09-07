//
//  MainViewModel.swift
//  TestAzteca
//
//  Created by PorMientras on 04/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import UIKit

class MainViewModel: NSObject {
    
    var dataMainCellModel : [DataMainCellModel]?
    
    override init() {
        super.init()
        self.dataMainCellModel = self.loadJsonDataMainCell(filename: "DataMainCell")
    }

    func loadJsonDataMainCell(filename fileName: String) -> [DataMainCellModel]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Array<DataMainCellModel>.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
