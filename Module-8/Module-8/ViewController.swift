//
//  ViewController.swift
//  Module-8
//
//  Created by A Erokhina on 20.07.2021.
//

import UIKit

func strikeText(strike : String) -> NSMutableAttributedString {

let attributeString = NSMutableAttributedString(string: strike)
attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
value: NSUnderlineStyle.single.rawValue,
range: NSMakeRange(0, attributeString.length))

return attributeString
}

class myUIView : UIView {
    
      
    
    
    init (mainControlller : UIViewController, positionX : Int , positionY : Int, oldPrice : Double, price : Double, textLabel : String, clothesImage: UIImage?){
        
        let frameWidth : Int = Int(mainControlller.view.frame.width)
        let frameHeigt : Int = Int(mainControlller.view.frame.height)

        // initial object - UIView
        super.init(frame: CGRect(x: Int(Double(frameWidth) * 0.08 * Double(positionX + 1) + Double(frameWidth) * 0.38 * Double(positionX)),
                                 y: Int(Double(frameHeigt) * 0.08 * Double(positionY + 1) + Double(frameHeigt) * 0.38 * Double(positionY)),
                                 width: Int(Double(frameWidth) * 0.38),
                                 height: Int(Double(frameHeigt) * 0.38)))

        // Label text  - light gray
        let myTextLabel = UILabel (frame: CGRect (x: 00, y: self.frame.height * 0.94, width: self.frame.width, height: self.frame.height * 0.06))
        myTextLabel.text = textLabel
        super.addSubview(myTextLabel)
        myTextLabel.backgroundColor = UIColor.white
        myTextLabel.textColor = UIColor.lightGray
        myTextLabel.font = UIFont.systemFont(ofSize: self.frame.height * 0.06)

        // New price - red text
        let myPriceLabel = UILabel (frame: CGRect (x: 00, y: self.frame.height * 0.84, width: self.frame.width, height: self.frame.height * 0.1))
        myPriceLabel.text = "\(String(price)) руб"
        super.addSubview(myPriceLabel)
        myPriceLabel.backgroundColor = UIColor.white
        myPriceLabel.textColor = UIColor.red
        myPriceLabel.font = UIFont.systemFont(ofSize: self.frame.height * 0.1)

        // Old price - black striked text
        let myOldPriceLabel = UILabel (frame: CGRect (x: 00, y: self.frame.height * 0.8, width: self.frame.width, height: self.frame.height * 0.04))
        myOldPriceLabel.attributedText = strikeText(strike: "\(String (oldPrice)) руб.")
        super.addSubview(myOldPriceLabel)
        myOldPriceLabel.backgroundColor = UIColor.white
        myOldPriceLabel.textColor = UIColor.black
        myOldPriceLabel.font = UIFont.systemFont(ofSize: self.frame.height * 0.04)
        
        // Image with clothes
        let myImage = UIImageView (frame: CGRect (x: 00, y: 00, width: self.frame.width, height: self.frame.height * 0.8))
        myImage.image = clothesImage
        myImage.contentMode = UIView.ContentMode.scaleAspectFit
        super.addSubview(myImage)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newView1 = myUIView (mainControlller: self , positionX: 0, positionY: 0, oldPrice:  1111.0, price:  1000.0, textLabel: "Мужская майка", clothesImage: UIImage(named:"1") )
        let newView2 = myUIView (mainControlller: self , positionX: 0, positionY: 1, oldPrice:  2222.0, price:  2000.0, textLabel: "Детское платьице", clothesImage: UIImage(named:"2"))
        let newView3 = myUIView (mainControlller: self , positionX: 1, positionY: 0, oldPrice:  33333.0, price:  30000.0, textLabel: "Платье", clothesImage: UIImage(named:"3"))
        let newView4 = myUIView (mainControlller: self , positionX: 1, positionY: 1, oldPrice:  444.0, price:  400.0, textLabel: "Женская юбка", clothesImage: UIImage(named:"4"))
        super.view.addSubview(newView1)
        super.view.addSubview(newView2)
        super.view.addSubview(newView3)
        super.view.addSubview(newView4)
    }


}

