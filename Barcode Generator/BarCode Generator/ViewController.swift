//
//  ViewController.swift
//  BarCode Generator
//
//  Created by Abhishek Suryawanshi on 21/01/18.
//  Copyright © 2018 iOSDevelopment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var codeSelector: UISegmentedControl!
    @IBOutlet weak var barcodeImage: UIImageView!
    
    var filter:CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textCodeSubmitButton(_ sender: Any) {
        
        if let text = dataTextField.text {
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if codeSelector.selectedSegmentIndex == 0 {
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            }
            else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 15, y: 15)
            
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            barcodeImage.image = image
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

