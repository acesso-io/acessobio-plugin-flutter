import 'package:acessobio_plugin/OCRResponse.dart';
import 'package:acessobio_plugin/ResultAuthenticate.dart';
import 'package:acessobio_plugin/ResultCamera.dart';
import 'package:acessobio_plugin/ResultLivenessX.dart';
import 'package:acessobio_plugin/ResultCameraDocument.dart';
import 'package:acessobio_plugin_example/acessoPass.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
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
  // bool _platformVersion;
  // Map<dynamic, dynamic> platformVersion;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {

    // String platformVersion;
    // bool platformVersion;
    Map<dynamic, dynamic> platformVersion;


    AcessobioPlugin acessobioPlugin = new AcessobioPlugin.iAcessoBioCamera(
        acessoPass.url,
        acessoPass.apikey,
        acessoPass.token,
      this
    );


    try {

      // acessobioPlugin.openLiveness;
      // acessobioPlugin.openLivenessWithCreateProcess("nome","1234567");
      // acessobioPlugin.openCameraDocumentOCR(AcessobioPlugin.CNH); // No IOS nao retorna resultado tela fica congelada no documento
      // acessobioPlugin.openFaceMatch(AcessobioPlugin.CNH); // padronizar o result em um objeto ios e android (objeto estava retornando onSuccess errado)
      // acessobioPlugin.openCameraDocument(AcessobioPlugin.CNH);

      // acessobioPlugin.openCameraWithCreateProcessAndInsertDocument(" code ", " name ", AcessobioPlugin.CNH);// no IOS ainda nao foi inplementado

      // acessobioPlugin.openLivenessAuthenticate("10642352984");

      // acessobioPlugin.openCamera;
      acessobioPlugin.openCameraWithCreateProcess("lucas", "123321123",null,null,null,null);


    } on PlatformException {
      //platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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
  void onSucessFaceMatch(bool status) {
    // TODO: implement onSucessFaceMatch
  }









}
