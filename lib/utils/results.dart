sealed class Results{}
class ErrorResult extends Results {
  final String code;

  ErrorResult({required this.code});
}
class SuccessResult extends Results {}
class LoadingResult extends Results {}