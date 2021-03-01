import 'ErrorBio.dart';
import 'ResultAuthenticate.dart';

abstract class IAcessoBioAuthenticate
{
  void onSuccessAuthenticate(ResultAuthenticate result);
  void onErrorAuthenticate(ErrorBio errorBio);
}