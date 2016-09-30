//: Playground - noun: a place where people can play

import UIKit

let numberOfCircles = 10
let ringSize: CGFloat = 25.0
let previewContentSize: CGFloat = 10.0
let previewWindowRadius: CGFloat = 5.0

protocol Drawable {
    func draw(parent: UIView)
}

struct Circle {
    
    var center: CGPoint
    var radius: CGFloat
    var fillColor: UIColor
    var view: UIView?
    
    mutating func draw(parent: UIView) {
        view = UIView(frame: CGRect(x: center.x, y: center.y, width: radius * 2, height: radius * 2))
        view?.center = center
        view!.backgroundColor = fillColor
        view!.layer.cornerRadius = radius
        view!.layer.borderWidth = 1
        view!.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        parent.addSubview(view!)
    }
}

let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let center = CGPoint(x: 250, y: 250)
let colors: [UIColor] = [.yellow, .yellow, .yellow, .red, .red, .blue, .blue, .black, .black, .white, .white]

for idx in (0..<numberOfCircles).reversed() {
    
    var circle = Circle(center: center, radius: ringSize * CGFloat(idx), fillColor: colors[idx], view: nil)
    circle.draw(parent: mainView)
}

mainView


UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 2.0)
mainView.drawHierarchy(in: CGRect(x: -250, y: -250, width: mainView.frame.size.width, height: mainView.frame.size.height), afterScreenUpdates: true)
var image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!

let imageView = UIImageView(image: image)
imageView.layer.cornerRadius = imageView.frame.size.width / 2;imageView
imageView.clipsToBounds = true

imageView











