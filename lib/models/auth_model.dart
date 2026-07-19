class AuthModel{
  bool statusCode;
  String message;

  AuthModel({required this.statusCode,required this.message});
  factory AuthModel.fromJSon(Map<String,dynamic> json){
    return AuthModel(statusCode:json['statusCode'] , message:json['message'] );

  }
}