//
//  ViewController.swift
//  HelloWorld
//
//  Created by user on 2023/07/12.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
 
    
    @IBAction func btnResizeImage(_ sender: Any) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        }
        else {
            imgView.image = imgOff
        }
    }
}

