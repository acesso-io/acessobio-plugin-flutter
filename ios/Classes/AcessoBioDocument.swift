//
//  AcessoBioDocument.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioDocument: AcessoBioView, AcessoBioDelegate{
    
    override func callMethodBio(){
        switch method {
            
            case "openCameraDocumentOCR":openCameraDocumentOCR()
            case "openFaceMatch":openFaceMatch()
            case "openCameraDocument":openCameraDocuments()
            case "openCameraWithCreateProcess":openCameraWithCreateProcess()
                
            default: flutterResult(FlutterMethodNotImplemented)
        }
    }
    
    func openCameraDocumentOCR(){
        let document_type = valueExtra["DOCUMENT_TYPE"] as? Int
        var document = DocumentType.none
        
        switch document_type {
            case 501: do { document = DocumentType.CNH }
            case 502: do { document = DocumentType.CNH }
            case 4: do { document = DocumentType.CNH }
            case 99: do { document = DocumentType.CNH }
                
            default: document = DocumentType.none
        }
        
        if(document_type != 0 && document_type != nil){
            acessoBioManager.openCameraDocumentOCR(document)
        }else{
            onError(msg: "Informe tipo de documento")
        }
    }
    
    func openFaceMatch(){
        let document_type = valueExtra["DOCUMENT_TYPE"] as? Int
        var document = DocumentType.none
        
        switch document_type {
            case 501: do { document = DocumentType.CNH }
            case 502: do { document = DocumentType.CNH }
            case 4: do { document = DocumentType.CNH }
            case 99: do { document = DocumentType.CNH }
                
            default: document = DocumentType.none
        }
        
        if(document_type != 0 && document_type != nil){
            acessoBioManager.openCameraDocumentFacematch(document)
        }else{
            onError(msg: "Informe tipo de documento")
        }
    }
    
    func openCameraDocuments(){
        let document_type = valueExtra["DOCUMENT_TYPE"] as? Int
        var document = DocumentType.none
        
        switch document_type {
            case 501: do { document = DocumentType.CNH }
            case 502: do { document = DocumentType.CNH }
            case 4: do { document = DocumentType.CNH }
            case 99: do { document = DocumentType.CNH }
                
            default: document = DocumentType.none
        }
        
        if(document_type != 0 && document_type != nil){
            acessoBioManager.openCameraDocuments(document)
        }else{
            onError(msg: "Informe tipo de documento")
        }
    }
    
    func openCameraWithCreateProcess(){
       //no implemented
    }
    
    //results
    func onSuccesCameraDocument(_ result: CameraDocumentResult!){
        flutterResult(convertObjToDicionary(result: result, status: true))
    }
    
    func onErrorCameraDocument(_ error: String!){
        flutterResult(convertObjToDicionary(result: error, status: false))
    }

    func onSuccessOCR(_ result: OCRResult!){
        flutterResult(convertObjToDicionary(result: result, status: true))
    }

    func onErrorOCR(_ error: String){
        flutterResult(convertObjToDicionary(result: error, status: false))
    }
    
    func onSuccessFacematch(_ result: FacematchResult!){
        flutterResult(convertObjToDicionary(result: result, status: true))
    }
    
    func onErrorFacematch(_ result: String!){
        flutterResult(convertObjToDicionary(result: result, status: false))
    }
    
    
    // to remove
    func onSuccesLivenessX(_ result: LivenessXResult!) {}
    
    func onErrorLivenessX(_ error: String!) {}
    
    func onSuccesCameraFace(_ result: CameraFaceResult!) {}
    
    func onErrorCameraFace(_ error: String!) {}
    
    

}
