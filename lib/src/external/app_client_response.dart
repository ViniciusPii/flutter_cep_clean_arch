class AppClientResponse<T> {
  AppClientResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  T? data;
  int? statusCode;
  String? message;
}
