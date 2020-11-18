//
//  ViewController.swift
//  LibraryEvolution
//
//  Created by Li, Ming on 2020/11/16.
//  Copyright © 2020 Visa Inc. All rights reserved.
//

import UIKit
import PublicStruct

class ViewController: UIViewController {
    @IBOutlet weak var validLabelInStoryboard: UILabel!
    
    // MING LI:
    //
    // App crashes when all following conditions satisfied:
    // 1. In iOS 12.x
    // 2. This UIView / UIViewController is initialized from nib files
    // 3. A ABI-public struct is a property defined in this UIView / UIViewController
    //
    var method: CardOwnerVerificationMethod?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
