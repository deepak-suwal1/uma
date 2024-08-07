class ErrorResponse {
  final String? message;
  final Map<String, List<String>>? errors;

  ErrorResponse({
    this.message,
    this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
      errors: (json['errors'] as Map<String, dynamic>?)?.map((key, value) {
        return MapEntry(
            key, (value as List<dynamic>).map((e) => e.toString()).toList());
      }),
    );
  }
}
