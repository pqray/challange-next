//
//  Utils.swift
//  challange
//
//  Created by Rayssa Ribeiro on 12/09/22.
//


import Foundation
import UIKit
import CryptoKit

enum KeyString: String {
    case publicKey
    case privateKey
}

enum ErrorString: String {
    case error = "Error",
         serverMsg = "Wrong with the credentials",
         internetIssue = "Internet issue",
         connectToInternet = "Please connect to internet"
}

enum ErrorMessage: String {
    case invalidAPIKey = "The passed API key is invalid.",
         invalidCredetial = "InvalidCredentials",
         vaildTimeStamp = "You must provide a timestamp.",
         missingParams = "MissingParameter"
}

class Utils: NSObject {
    
    //MARK:- Genrate hash from Cryptokit
    class func md5Hash(_ source: String) -> String {
        let digest = Insecure.MD5.hash(data: source.data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    //MARK:- Get Keys from Marvel Plist file
    class func getAPIKeys() -> [String: Any] {
        if let path = Bundle.main.path(forResource: "keysApi", ofType: "plist") {
            let plist = NSDictionary(contentsOfFile: path) ?? ["":""]
            let publicKey = plist[KeyString.publicKey.rawValue] as! String
            let privateKey = plist[KeyString.privateKey.rawValue] as! String
            let dict = [KeyString.publicKey.rawValue: publicKey, KeyString.privateKey.rawValue: privateKey]
            return dict
            
        }
        return ["": ""]
        
    }
    
    //MARK:- Set corner radius for Cell background view
    func setCornerRadius(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        
    }
    
    //MARK:- Show Error Message Alert
    func showAlertView(title : String,messsage: String)  {
        let alertController = UIAlertController(title: title, message: messsage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
    }

}
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
        
        if let leftAnchor = leftAnchor, let padding = paddingLeft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
