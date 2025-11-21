class ErrorModel 
{
  final int? code;
  final String? message;

  ErrorModel({this.code, this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(code: json['code'], message: json['message']);
  }
}