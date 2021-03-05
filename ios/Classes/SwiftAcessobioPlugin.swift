
import Flutter
import UIKit


public class SwiftAcessobioPlugin: NSObject, FlutterPlugin {
    
    var result: FlutterResult!
    var urlIntance: String = ""
    var apikey: String = ""
    var authToken: String = ""
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "acessobio", binaryMessenger: registrar.messenger())
        let instance = SwiftAcessobioPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result
        
        let argument = call.arguments as? Dictionary<String, Any>
        if(argument == nil){
            self.result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
        
        validKeys(
            urlIntance: argument!["urlIntance"] as? String,
            apikey: argument!["apikey"] as? String,
            authToken: argument!["authToken"] as? String
        )
           
        switch call.method {
            //Liveness
            case "openLiveness": acessoBioLiveness(method: call.method)
            case "openLivenessWithCreateProcess": acessoBioLiveness(
                method: call.method,
                name: argument!["name"]! as? String,
                document: argument!["document"]! as? String
            )
                    
            //Document
            case "openCameraDocumentOCR": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openFaceMatch": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openCameraDocument": openCameraDocumentOCR(method: call.method,DOCUMENT_TYPE: argument!["DOCUMENT_TYPE"] as? Int)
            case "openCameraInsertDocument": result(FlutterMethodNotImplemented)

            //Auth
            case "openLivenessAuthenticate": openLivenessAuthenticate(method: call.method, code: argument!["code"] as? String )

            //Camera
            case "openCamera": openCamera(method: call.method )
            case "openCameraWithCreateProcess": openCamera(
                method: call.method,
                nome: argument!["nome"]! as? String,
                code: argument!["code"]! as? String,
                gender: argument!["gender"]! as? String,
                birthdate: argument!["birthdate"]! as? String,
                email: argument!["email"]! as? String,
                phone: argument!["phone"]! as? String
            )
                    
            default: result(FlutterMethodNotImplemented)
        }
        
    }
    
    private func createView(method: String, acessoBioView:AcessoBioView) -> AcessoBioView {
        
        acessoBioView.flutterResult = result
        acessoBioView.method = method
        acessoBioView.urlIntance = self.urlIntance
        acessoBioView.apikey = self.apikey
        acessoBioView.authToken = self.authToken
        
        return acessoBioView
    }
    private func initView(acessoBioView:AcessoBioView ){
        let nav = UINavigationController(rootViewController: acessoBioView)
        nav.setNavigationBarHidden(false, animated: false)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let viewController: UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!;
        viewController.present(nav, animated: true, completion: nil)
    }
    private func validKeys(urlIntance: String?, apikey: String?, authToken: String?){
            
        if(urlIntance != nil && urlIntance != "" ){
            self.urlIntance = urlIntance!
        }else{self.result(FlutterError.init(code: "bad args urlIntance", message: nil, details: nil))}
            
        if(apikey != nil && apikey != "" ){
            self.apikey = apikey!
        }else{self.result(FlutterError.init(code: "bad args apikey", message: nil, details: nil))}
           
        if(authToken != nil && authToken != "" ){
            self.authToken = authToken!
        }else{self.result(FlutterError.init(code: "bad args authToken", message: nil, details: nil))}
        
    }
    
    // Liveness
    private func acessoBioLiveness(method: String){
        
        let acessoBioView = AcessoBioLiveness()
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
        
    }
    private func acessoBioLiveness(method: String, name: String?, document : String? ){
        
        let acessoBioView = AcessoBioLiveness()
        
        acessoBioView.valueExtra["name"] = name
        acessoBioView.valueExtra["document"] = document
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
        
    }
    
    //Document
    private func openCameraDocumentOCR(method: String, DOCUMENT_TYPE : Int?){
        
        let acessoBioView = AcessoBioDocument()
        
        acessoBioView.valueExtra["DOCUMENT_TYPE"] = DOCUMENT_TYPE
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
    
    //Auth
    private func openLivenessAuthenticate(method: String, code: String?){
        let acessoBioView = AcessoBioAuthenticate()
        
        acessoBioView.valueExtra["code"] = code
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
    //Camera
    private func openCamera(method: String){
        let acessoBioView = AcessoBioCamera()
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    private func openCamera(method: String, nome: String?, code: String?, gender: String?, birthdate: String?, email: String?, phone: String?){
        let acessoBioView = AcessoBioCamera()
        
        acessoBioView.valueExtra["nome"] = nome
        acessoBioView.valueExtra["code"] = code
        acessoBioView.valueExtra["gender"] = gender
        acessoBioView.valueExtra["birthdate"] = birthdate
        acessoBioView.valueExtra["email"] = email
        acessoBioView.valueExtra["phone"] = phone
        
        let view = createView(method: method, acessoBioView: acessoBioView)
        
        initView(acessoBioView: view)
    }
    
}

        
