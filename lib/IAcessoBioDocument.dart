import 'OCRResponse.dart';
import 'ResultCameraDocument.dart';

abstract class IAcessoBioDocument {

  void onSuccesstDocument(ResultCameraDocument result);

  void onSucessDocumentInsert(String processId, String typed);

  void onSucessFaceMatch(bool status);

  void onSuccessOCR(OCRResponse ocr);

  void onErrorDocument(String error);

  void onErrorDocumentInsert(String error);

  void onErrorFaceMatch(String error);

  void onErrorOCR(String error);

}