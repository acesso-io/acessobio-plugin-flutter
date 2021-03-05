
import 'package:flutter/services.dart';
import 'abstracts/IAcessoBio.dart';
import 'abstracts/IAcessoBioAuthenticate.dart';
import 'abstracts/IAcessoBioCamera.dart';
import 'abstracts/IAcessoBioDocument.dart';
import 'abstracts/IAcessoBioLiveness.dart';
import 'result/success/ResultCamera.dart';
import 'result/success/ResultAuthenticate.dart';
import 'result/success/OCRResponse.dart';
import 'result/success/ResultCameraDocument.dart';
import 'result/success/ResultFacematch.dart';
import 'result/success/ResultLivenessX.dart';
import 'result/error/ErrorBio.dart';

class AcessoBio {

  static const MethodChannel _channel = const MethodChannel('acessobio');

  String _urlIntance = null;
  String _apikey = null;
  String _authToken = null;

  static final int RG_FRENTE = 501;
  static final int RG_VERSO = 502;
  static final int CNH = 4;

  IAcessoBio iAcessoBio;
  IAcessoBioCamera iAcessoBioCamera;
  IAcessoBioDocument iAcessoBioDocument;
  IAcessoBioLiveness iAcessoBioLiveness;
  IAcessoBioAuthenticate iAcessoBioAuthenticate;

  AcessoBio(IAcessoBio context, String urlIntance, String apikey, String authToken){

    if(context is IAcessoBio){
      this.iAcessoBio = context;
    }else{
      throw new Exception("A classe iAcessoBio não foi implementada. É necessário realizar a implementação para prosseguir.");
    }

    if(context is IAcessoBioCamera){
      this.iAcessoBioCamera = context as IAcessoBioCamera;
    }
    if(context is IAcessoBioDocument){
      this.iAcessoBioDocument = context as IAcessoBioDocument;
    }
    if(context is IAcessoBioLiveness){
      this.iAcessoBioLiveness = context as IAcessoBioLiveness;
    }
    if(context is IAcessoBioAuthenticate){
      this.iAcessoBioAuthenticate = context as IAcessoBioAuthenticate;
    }

    _urlIntance = urlIntance;
    _apikey = apikey;
    _authToken = authToken;

  }

  bool validResult(Map<dynamic, dynamic> result){

    var flutterResult = result["flutterstatus"];

    if(flutterResult == 2){
      iAcessoBio.onErrorAcessoBio(ErrorBio(result));
      return false;
    }else if(flutterResult == -1){
      iAcessoBio.userClosedCameraManually();
      return false;
    }else {
      return true;
    }

  }


  //region LIVENESS
  get openLiveness async {

    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openLiveness',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken
    });

    if(validResult(result)) {

      if(result["flutterstatus"] == 1) {
        iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));
      }else{
        iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioLiveness.onSuccessLiveness(ResultLivenessX(result));
      }else{
        iAcessoBioLiveness.onErrorLiveness(ErrorBio(result));
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccessOCR(OCRResponse(result));
      }else{
        iAcessoBioDocument.onErrorOCR(result["result"]);
      }

    }

  }

  void openFaceMatch(int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openFaceMatch',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccessFaceMatch(ResultFacematch(result));
      }else{
        iAcessoBioDocument.onErrorFaceMatch(result["result"]);
      }

    }

  }

  void openCameraDocument(int DOCUMENT_TYPE) async {
    final Map<dynamic, dynamic> result = await _channel.invokeMethod('openCameraDocument',{
      "urlIntance":_urlIntance,
      "apikey":_apikey,
      "authToken":_authToken,
      "DOCUMENT_TYPE":DOCUMENT_TYPE
    });

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioDocument.onSuccesstDocument(ResultCameraDocument(result));
      }else{
        iAcessoBioDocument.onErrorFaceMatch(result["result"]);
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioAuthenticate.onSuccessAuthenticate(ResultAuthenticate(result));
      }else{
        iAcessoBioAuthenticate.onErrorAuthenticate(ErrorBio(result));
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
      }else{
        iAcessoBioCamera.onErrorCamera(ErrorBio(result));
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSuccessCamera(ResultCamera(result));
      }else{
        iAcessoBioCamera.onErrorCamera(ErrorBio(result));
      }

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

    if(validResult(result)){

      if(result["flutterstatus"] == 1){
        iAcessoBioCamera.onSucessDocumentInsert(result["processId"],result["typed"]);
      }else{
        iAcessoBioCamera.onErrorDocumentInsert(result["result"]);
      }

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
