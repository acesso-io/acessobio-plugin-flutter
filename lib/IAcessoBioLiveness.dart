import 'ErrorBio.dart';
import 'ResultLivenessX.dart';

abstract class IAcessoBioLiveness
{
  void onSuccessLiveness(ResultLivenessX result);
  void onErrorLiveness(ErrorBio errorBio);
}