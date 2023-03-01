class AuthModel {
  String? message;
  bool? status;
  Data? data;

  AuthModel.fromAuthResponse(Map<String, dynamic> authData) {
    status = authData["status"];
    message = authData["message"];
    data = Data.fromAuthJson(authData["data"]);
  }
}

class Data {
  String? name, email, phone, token;
  Data.fromAuthJson(Map<String,dynamic>? dataJson){
    name = dataJson?["name"];
    email = dataJson?["email"];
    phone = dataJson?["phone"];
    token = dataJson?["token"];
  }
}


