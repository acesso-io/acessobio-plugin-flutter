//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioAuthenticate: AcessoBioView, AcessoBioDelegate{
 
    
    override func callMethodBio(){
        switch method {
            
            case "openLivenessAuthenticate": openLivenessAuthenticate()
            
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
        
    }
    
    private func openLivenessAuthenticate(){
        
        let code = valueExtra["code"] as? String
        
        if(code != nil){
            acessoBioManager.facesCompare(code)
        }else{
            onError(msg: "informe o code")
        }
        
    }
    
    func onSuccessFacesCompare(_ result: Bool){
        flutterResult(convertObjToDicionary(result: result, status: true))
    }
    
    func onErrorFacesCompare(_ error: String!){
        flutterResult(convertObjToDicionary(result: error, status: false))
    }

    
    
}
