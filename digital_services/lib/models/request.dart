class RequestOTPModel {
  String _mobileNumber;

  RequestOTPModel({String mobileNumber}) {
    this._mobileNumber = mobileNumber;
  }

  String get mobileNumber => _mobileNumber;
  set mobileNumber(String mobileNumber) => _mobileNumber = mobileNumber;

  RequestOTPModel.fromJson(Map<String, dynamic> json) {
    _mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this._mobileNumber;
    return data;
  }
}