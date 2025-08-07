class SignInModel {
  String? status;
  List<Data>? data;

  SignInModel({this.status, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  int? userVerifycode;
  int? userApprove;
  String? userCreate;

  Data(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userPhone,
      this.userVerifycode,
      this.userApprove,
      this.userCreate});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userPhone = json['user_phone'];
    userVerifycode = json['user_verifycode'];
    userApprove = json['user_approve'];
    userCreate = json['user_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    data['user_phone'] = this.userPhone;
    data['user_verifycode'] = this.userVerifycode;
    data['user_approve'] = this.userApprove;
    data['user_create'] = this.userCreate;
    return data;
  }
}