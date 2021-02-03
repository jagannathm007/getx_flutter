class APIResponse {
  String message;
  bool isSuccess;
  dynamic data;

  APIResponse({this.message, this.isSuccess, this.data});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      message: json['Message'] as String,
      isSuccess: json['IsSuccess'] as bool,
      data: json['Data'] as String,
    );
  }
}
