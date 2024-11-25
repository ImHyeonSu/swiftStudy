//
//  ViewController.swift
//  PickerView_study3
//
//  Created by h2yn on 2024/11/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpeg", "2.jpeg", "3.jpeg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            // イメージ生成
            let image = UIImage(named: imageFileName[i])
            // 格納
            imageArray.append(image)
        }
        // init
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // pcikerview側にcomponentの数を整数で渡すdelegate
    // pickerviewで表示される列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // pickerviewの高さ設定
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // pickerviewに列の数を整数で渡す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
//    // pickerviewの列のタイトル
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // pickerviewの列をイメージを出す
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    // pickerviewが選択された場合、uiimageを出す
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
}

