//
//  ViewController.swift
//  nanabayasi
//
//  Created by h2yn on 2024/11/11.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff:   UIImage?
    
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    // actionは大体最後に
    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
        
    }

    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
        }else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("縮小", for: .normal)
            
        }
        imgView.frame.size = CGSize(width:newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
                if sender.isOn{
                    imgView.image = imgOn
                }else{
                    imgView.image = imgOff
                }
    }
    //    @IBAction func switchImageOnOff(_ sender: UISwitch) {
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
//    }
    
    // 最初のstartのとき呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "1.png")
        imgOff = UIImage(named: "2.png")
        
        imgView.image = imgOn
    }
}

