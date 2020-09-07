//
//  ItemsActionsViewModel.swift
//  TestAzteca
//
//  Created by PorMientras on 07/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import UIKit

class ItemsActionsViewModel: NSObject {
    
    func loadImage(targetImage:UIImageView) {
        
        let nsURL = NSURL(string: "https://hotbook.com.mx/wp-content/uploads/2019/04/hotbook-se-revela-la-primera-imagen-de-un-agujero-negro-portada.jpg")
        
        let task = URLSession.shared.dataTask(with: nsURL! as URL) {
            (data, response, error) in
            if (error != nil) {
                NSLog("No Error!")
                let image:UIImage = UIImage(data: data!)!
                targetImage.image = image
            }
            else {
                NSLog("Error!")
            }
        }
        
        task.resume()
    }
}
