
import 'ErrorBio.dart';
import 'ResultCamera.dart';

abstract class IAcessoBioCamera {
  void onSuccessCamera(ResultCamera result);
  void onErrorCamera(ErrorBio errorBio);
}
