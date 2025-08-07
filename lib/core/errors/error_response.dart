class ErrorResponse {
  final int status;
  final String errorMessage;

  ErrorResponse({
    required this.status,
    required this.errorMessage,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['statusCode'] ?? 0,
      errorMessage: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': status,
      'message': errorMessage,
    };
  }
}
