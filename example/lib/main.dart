import 'package:flutter/material.dart';
import 'package:acessobio_plugin_example/acessoPass.dart';
import 'package:acessobio_plugin/acessobio_plugin.dart';
import 'package:acessobio_plugin/abstracts/IAcessoBio.dart';
import 'package:acessobio_plugin/abstracts/IAcessoBioAuthenticate.dart';
import 'package:acessobio_plugin/abstracts/IAcessoBioCamera.dart';
import 'package:acessobio_plugin/abstracts/IAcessoBioDocument.dart';
import 'package:acessobio_plugin/abstracts/IAcessoBioLiveness.dart';
import 'package:acessobio_plugin/result/success/OCRResponse.dart';
import 'package:acessobio_plugin/result/success/ResultAuthenticate.dart';
import 'package:acessobio_plugin/result/success/ResultCamera.dart';
import 'package:acessobio_plugin/result/success/ResultLivenessX.dart';
import 'package:acessobio_plugin/result/success/ResultCameraDocument.dart';
import 'package:acessobio_plugin/result/success/ResultFacematch.dart';
import 'package:acessobio_plugin/result/error/ErrorBio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget  {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> implements IAcessoBio, IAcessoBioCamera, IAcessoBioDocument, IAcessoBioLiveness, IAcessoBioAuthenticate {

  String _result = "Esta biblioteca visa implementar a tecnologia Unico";
  AcessoBio acessobio;

  @override
  void initState() {
    super.initState();
    initAcessoBio();
  }

  Future<void> initAcessoBio() async {
    //Inicialmente, para utilizar a tecnologia implemente a classe Acessobio.
    //Implementar construtor de acordo com a tecnologia que ira utilizar
    acessobio = new AcessoBio(
        this,
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token
    );
    customLayout(); // Adiciona layout customizado
  }

  Future<void> initLiveness() async{
    acessobio.openLiveness;
    // acessobio.openLivenessWithCreateProcess("lucas diniz","123123123123");
  }

  Future<void> initDocument() async{
    acessobio.openCameraDocumentOCR(AcessoBio.CNH);
    // acessobio.openFaceMatch(AcessoBio.CNH);
    // acessobio.openCameraDocument(AcessoBio.CNH);
  }

  Future<void> initAuth() async{
    acessobio.openLivenessAuthenticate("12345678909");
  }

  Future<void> initCamera() async{
    acessobio.openCamera;
    // acessobio.openCameraWithCreateProcess("lucas", "12345678909",null,null,null,null);
    // acessobio.openCameraWithCreateProcessAndInsertDocument("12345678909", "Lucas Diniz", AcessoBio.CNH);// no IOS ainda nao foi inplementado // retornando na interface errada

  }

  Future<void> customLayout() async {

    // --- CUSTOM LAYOUT Android
    // acessobio.setAndroidColorSilhoutte("#87CEFA","#87CEFA");
    // acessobio.setAndroidColorBackground("#901850");
    // acessobio.setAndroidColorBoxMessage("#901850");
    // acessobio.setAndroidColorTextMessage("#901850");
    // acessobio.setAndroidColorBackgroundPopupError("#901850");
    // acessobio.setAndroidColorTextPopupError("#901850");
    // acessobio.setAndroidColorBackgroundButtonPopupError("#901850");
    // acessobio.setAndroidColorTextButtonPopupError("#901850");
    // acessobio.setAndroidColorBackgroundTakePictureButton("#901850");
    // acessobio.setAndroidColorIconTakePictureButton("#901850");
    // acessobio.setAndroidColorBackgroundBottomDocument("#901850");
    // acessobio.setAndroidColorTextBottomDocument("#901850");

    // --- CUSTOM LAYOUT IOS
    // acessobio.setIosColorSilhoutteNeutra("#901850");
    // acessobio.setIosColorSilhoutteSuccess("#901850");
    // acessobio.setIosColorSilhoutteError("#901850");
    // acessobio.setIosColorBackground("#901850");
    // acessobio.setIosColorBackgroundBoxStatus("#901850");
    // acessobio.setIosColorTextBoxStatus("#901850");
    // acessobio.setIosColorBackgroundPopupError("#901850");
    // acessobio.setIosColorTextPopupError("#901850");
    // acessobio.setIosImageIconPopupError("#901850");

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app unico'),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
          alignment: Alignment.center,

          child: Column(
            children: <Widget>[

              ElevatedButton.icon(
                onPressed: initLiveness,
                icon: Icon(Icons.camera, size: 18),
                label: Text("Open Liveness"),
              ),

              ElevatedButton.icon(
                onPressed: initDocument,
                icon: Icon(Icons.pages, size: 18),
                label: Text("Open Document"),
              ),

              ElevatedButton.icon(
                onPressed: initCamera,
                icon: Icon(Icons.camera, size: 18),
                label: Text("Open Camera"),
              ),

              Padding(
              padding: const EdgeInsets.all(95),
                child: Text(
                    '$_result\n'
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  //OVERRIDES

  //region -- IAcessoBio
  @override
  void onErrorAcessoBio(ErrorBio errorBio) {
    // TODO: implement onErrorAcessoBio
  }

  @override
  void userClosedCameraManually() {
    // TODO: implement userClosedCameraManually
  }

  //endregion

  //region -- IAcessoBioCamera
  @override
  void onErrorCamera(ErrorBio errorBio) {
    // TODO: implement onErrorCamera
  }

  @override
  void onErrorDocumentInsert(String error) {
    // TODO: implement onErrorDocumentInsert
  }

  @override
  void onSuccessCamera(ResultCamera result) {
    // TODO: implement onSuccessCamera
  }

  @override
  void onSucessDocumentInsert(String processId, String typed) {
    // TODO: implement onSucessDocumentInsert
  }

  //endregion

  //region -- IAcessoBioDocument
  @override
  void onErrorDocument(String error) {
    // TODO: implement onErrorDocument
  }

  @override
  void onErrorFaceMatch(String error) {
    // TODO: implement onErrorFaceMatch
  }

  @override
  void onErrorOCR(String error) {
    // TODO: implement onErrorOCR
  }

  @override
  void onSuccessFaceMatch(ResultFacematch result) {
    // TODO: implement onSuccessFaceMatch
  }

  @override
  void onSuccessOCR(OCRResponse ocr) {
    // TODO: implement onSuccessOCR
  }

  @override
  void onSuccesstDocument(ResultCameraDocument result) {
    // TODO: implement onSuccesstDocument
  }

  //endregion

  //region -- IAcessoBioLiveness
  @override
  void onErrorLiveness(ErrorBio errorBio) {
    // TODO: implement onErrorLiveness
  }

  @override
  void onSuccessLiveness(ResultLivenessX result) {
    // TODO: implement onSuccessLiveness
  }

  //endregion

  //region -- IAcessoBioAuthenticate
  @override
  void onErrorAuthenticate(ErrorBio errorBio) {
    // TODO: implement onErrorAuthenticate
  }

  @override
  void onSuccessAuthenticate(ResultAuthenticate result) {
    // TODO: implement onSuccessAuthenticate
  }

  //endregion


}
