import 'package:flutter/material.dart';
import 'package:acessobio_plugin/OCRResponse.dart';
import 'package:acessobio_plugin/ResultAuthenticate.dart';
import 'package:acessobio_plugin/ResultCamera.dart';
import 'package:acessobio_plugin/ResultLivenessX.dart';
import 'package:acessobio_plugin/ResultCameraDocument.dart';
import 'package:acessobio_plugin/ResultFacematch.dart';
import 'package:acessobio_plugin_example/acessoPass.dart';
import 'package:acessobio_plugin/IAcessoBioAuthenticate.dart';
import 'package:acessobio_plugin/IAcessoBioCamera.dart';
import 'package:acessobio_plugin/IAcessoBioDocument.dart';
import 'package:acessobio_plugin/IAcessoBioLiveness.dart';
import 'package:acessobio_plugin/acessobio_plugin.dart';
import 'package:acessobio_plugin/ErrorBio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget  {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements IAcessoBioCamera, IAcessoBioDocument, IAcessoBioLiveness, IAcessoBioAuthenticate {

  String _platformVersion;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    String platformVersion = "Esta biblioteca visa implementar a tecnologia Unico";

    //Inicialmente, para utilizar a tecnologia implemente a classe Acessobio.
    //Implementar construtor de acordo com a tecnologia que ira utilizar

    AcessoBio acessobioLiveness = new AcessoBio.iAcessoBioLiveness(
        this,
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token
    );
    AcessoBio acessobioDocument = new AcessoBio.iAcessoBioDocument(
        this,
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token
    );
    AcessoBio acessobioAuth = new AcessoBio.iAcessoBioAuthenticate(
        this,
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token
    );
    AcessoBio acessobioCamera = new AcessoBio.iAcessoBioCamera(
        this,
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token
    );

    //  --- LIVENESS ---
    acessobioLiveness.openLiveness;
    // acessobioLiveness.openLivenessWithCreateProcess("lucas diniz","10642352984");


    //  --- DOCUMENT ---
    // acessobioDocument.openCameraDocumentOCR(AcessobioPlugin.CNH);
    // acessobioDocument.openFaceMatch(AcessobioPlugin.CNH);
    // acessobioDocument.openCameraDocument(AcessobioPlugin.CNH);


    //  --- AUTH ---
    // acessobioAuth.openLivenessAuthenticate("10642352984");


    //  --- CAMERA ---
    // acessobioCamera.openCamera;
    // acessobioCamera.openCameraWithCreateProcess("lucas", "123321123",null,null,null,null);
    // acessobioCamera.openCameraWithCreateProcessAndInsertDocument("10642352984", "Lucas Diniz", AcessobioPlugin.CNH);// no IOS ainda nao foi inplementado // retornando na interface errada


    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app unico'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: initPlatformState,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void onErrorAuthenticate(ErrorBio errorBio) {
    // TODO: implement onErrorAuthenticate
  }

  @override
  void onErrorCamera(ErrorBio errorBio) {
    // TODO: implement onErrorCamera
  }

  @override
  void onErrorDocument(String error) {
    // TODO: implement onErrorDocument
  }

  @override
  void onErrorDocumentInsert(String error) {
    // TODO: implement onErrorDocumentInsert
  }

  @override
  void onErrorFaceMatch(String error) {
    // TODO: implement onErrorFaceMatch
  }

  @override
  void onErrorLiveness(ErrorBio errorBio) {
    // TODO: implement onErrorLiveness
  }

  @override
  void onErrorOCR(String error) {
    // TODO: implement onErrorOCR
  }

  @override
  void onSuccessAuthenticate(ResultAuthenticate result) {
    // TODO: implement onSuccessAuthenticate
  }

  @override
  void onSuccessCamera(ResultCamera result) {
    // TODO: implement onSuccessCamera
  }

  @override
  void onSuccessLiveness(ResultLivenessX result) {
    // TODO: implement onSuccessLiveness
  }

  @override
  void onSuccessOCR(OCRResponse ocr) {
    // TODO: implement onSuccessOCR
  }

  @override
  void onSuccesstDocument(ResultCameraDocument result) {
    // TODO: implement onSuccesstDocument
  }

  @override
  void onSucessDocumentInsert(String processId, String typed) {
    // TODO: implement onSucessDocumentInsert
  }

  @override
  void onSuccessFaceMatch(ResultFacematch result) {
    // TODO: implement onSucessDocumentInsert
  }


}
