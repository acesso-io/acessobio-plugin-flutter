
import 'package:flutter/services.dart';
import 'ErrorBio.dart';
import 'IAcessoBioAuthenticate.dart';
import 'IAcessoBioCamera.dart';
import 'IAcessoBioDocument.dart';
import 'IAcessoBioLiveness.dart';
import 'ResultCamera.dart';
import 'ResultAuthenticate.dart';
import 'OCRResponse.dart';
import 'ResultCameraDocument.dart';
import 'ResultFacematch.dart';
import 'ResultLivenessX.dart';

class AcessoBio {

  static const MethodChannel _channel = const MethodChannel('acessobio');

  String _urlIntance = null;
  String _apikey = null;
  String _authToken = null;

  static final int RG_FRENTE = 501;
  static final int RG_VERSO = 502;
  static final int CNH = 4;

  IAcessoBioCamera iAcessoBioCamera;
  IAcessoBioDocument iAcessoBioDocument;
  IAcessoBioLiveness iAcessoBioLiveness;
  IAcessoBioAuthenticate iAcessoBioAuthenticate;

  AcessoBio.iAcessoBioCamera(IAcessoBioCamera iAcessoBioCamera, String urlIntance, String apikey, String authToken){

    this.iAcessoBioCamera = iAcessoBioCamera;

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;
  }

  AcessoBio.iAcessoBioDocument(IAcessoBioDocument iAcessoBioDocument, String urlIntance, String apikey, String authToken){

    this.iAcessoBioDocument = iAcessoBioDocument;

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;

  }

  AcessoBio.iAcessoBioLiveness(IAcessoBioLiveness iAcessoBioLiveness, String urlIntance, String apikey, String authToken){

    this.iAcessoBioLiveness = iAcessoBioLiveness;

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;
  }

  AcessoBio.iAcessoBioAuthenticate(IAcessoBioAuthenticate iAcessoBioAuthenticate, String urlIntance, String apikey, String authToken){

    this.iAcessoBioAuthenticate = iAcessoBioAuthenticate;

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;
  }

  //region LIVENESS
  get openLiveness async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLiveness',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));

    }else{
      result.remove("flutterstatus");
      iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
    }

  }

  void openLivenessWithCreateProcess(String name, String document) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLivenessWithCreateProcess',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "name":name,
      "document":document
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));

    }else{
      result.remove("flutterstatus");
      iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
    }

  }
  //endregion

  //region DOCUMENT

  void openCameraDocumentOCR(int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraDocumentOCR',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioDocument.onSuccessOCR(OCRResponse(result));

    }else{
      result.remove("flutterstatus");
      iAcessoBioDocument.onErrorOCR(result["result"]);
    }

  }

  void openFaceMatch(int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openFaceMatch',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioDocument.onSuccessFaceMatch(ResultFacematch(result));
    }else{
      result.remove("flutterstatus");
      iAcessoBioDocument.onErrorFaceMatch(result["result"]);
    }

  }

  void openCameraDocument(int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraDocument',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioDocument.onSuccesstDocument(ResultCameraDocument(result));

    }else{
      result.remove("flutterstatus");
      iAcessoBioDocument.onErrorFaceMatch(result["result"]);
    }

  }

  //endregion

  //region AUTH

  void openLivenessAuthenticate(String code) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLivenessAuthenticate',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "code":code
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioAuthenticate.onSuccessAuthenticate(ResultAuthenticate(result));

    }else{
      result.remove("flutterstatus");
      iAcessoBioAuthenticate.onErrorAuthenticate(ErrorBio(result));
    }

  }

  //endregion

  //region CAMERA

  get openCamera async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCamera',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
    }else{
      result.remove("flutterstatus");
      iAcessoBioCamera.onErrorCamera(ErrorBio(result));
    }

  }

  void openCameraWithCreateProcess(String nome, String code, String gender, String birthdate, String email, String phone ) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraWithCreateProcess',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "nome":nome,
      "code":code,
      "gender":gender,
      "birthdate":birthdate,
      "email":email,
      "phone":phone
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
    }else{
      result.remove("flutterstatus");
      iAcessoBioCamera.onErrorCamera(ErrorBio(result));
    }

  }

  void openCameraWithCreateProcessAndInsertDocument(String code, String nome, int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraInsertDocument',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "code":code,
      "nome":nome,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(result["flutterstatus"]){
      result.remove("flutterstatus");
      iAcessoBioCamera.onSucessDocumentInsert(result["processId"],result["typed"]);

    }else{
      result.remove("flutterstatus");
      iAcessoBioCamera.onErrorDocumentInsert(result["result"]);
    }

  }

  //endregion

 //region COSTOMIZATION

  void setColorSilhoutte(String success_stroke_color,  String error_stroke_color){}

  void setColorBackground( String colorBlueMask){}

  void setColorBoxMessage( String colorWhite){}

  void setColorTextMessage( String colorBlack){}

  void setColorBackgroundPopupError( String colorAccent){}

  void setColorTextPopupError( String colorGreen){}

  void setColorBackgroundButtonPopupError( String red_btn_bg_color){}

  void setColorTextButtonPopupError( String colorPrimary){}

  void setColorBackgroundTakePictureButton( String colorGreyDark){}

  void setColorIconTakePictureButton( String colorOrange){}

  void setColorBackgroundBottomDocument( String red_btn_bg_color){}

  void setColorTextBottomDocument( String colorGreen){}

  void setImageIconPopupError( String ivPopupError){}

 //endregion

}
