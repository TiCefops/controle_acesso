enum CommonErrorCode {
  notFound,
  connectionError,


}

class CommonErrors {
  final CommonErrorCode key;
  final String? message;

  const CommonErrors({
    required this.key,
    this.message,
  });
}