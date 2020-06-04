class VerifyOTPModel {
  String _mobileNumber;
  String _otp;

  VerifyOTPModel({String mobileNumber, String otp}) {
    this._mobileNumber = mobileNumber;
    this._otp = otp;
  }

  String get mobileNumber => _mobileNumber;
  set mobileNumber(String mobileNumber) => _mobileNumber = mobileNumber;
  String get otp => _otp;
  set otp(String otp) => _otp = otp;

  VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    _mobileNumber = json['mobileNumber'];
    _otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this._mobileNumber;
    data['otp'] = this._otp;
    return data;
  }
}