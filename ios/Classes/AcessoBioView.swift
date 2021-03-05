//
//  AcessoBioView.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 18/02/21.
//

import UIKit
import Flutter

class AcessoBioView: UIViewController, AcessoBioDelegate {
    
    var acessoBioManager: AcessoBioManager!
    var isOpenCamera: Bool =  false
    var flutterResult: FlutterResult!
    var method: String = ""
    var urlIntance: String = ""
    var apikey: String = ""
    var authToken: String = ""
    var valueExtra = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAcessoBio()
        callMethodBio()
        
        

        self.view.backgroundColor = UIColor.white;
        self.navigationController!.setToolbarHidden(false, animated: false)
    }
    
    func callMethodBio(){}
    
    private func initAcessoBio(){
        
        acessoBioManager = AcessoBioManager(
            viewController: self,
            url: urlIntance,
            apikey: apikey,
            token:authToken
        );
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(isOpenCamera){
            self.dismiss(animated: true, completion: nil)
        }
        isOpenCamera = true
    }
    
    func userClosedCameraManually(){
        flutterResult(convertObjToDicionary(result: 0, status: -1))
    }
    
    func onError(msg: String){
        flutterResult(convertObjToDicionary(result: msg,status: 0))
    }
    
    //CONVERT RESULT TO HASHMAP
    func convertObjToDicionary(result : NSObject, status: Int) -> [String:Any] {
        
        let obj: AnyClass = result.classForCoder
        var outCount : UInt32 = 0
        let properties = class_copyPropertyList(obj, &outCount)
        var dict = [String:Any]()
        
        for i in 0 ..< Int(outCount) {
            
            let property = properties?[i],

            strKey = NSString(utf8String: property_getName(property!)) as String?

            let attrs = result.value(forKey: strKey!)
            
            if(attrs != nil){
                dict[strKey!] = attrs
            }else{
                dict[strKey!] = ""
            }
              
        }
        
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : Bool, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : String, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : Int, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    
    
    
}
