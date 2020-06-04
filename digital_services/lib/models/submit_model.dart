class SubmitModel {
  int _age;
  String _mobileNumber;

  SubmitModel({int age, String mobileNumber}) {
    this._age = age;
    this._mobileNumber = mobileNumber;
  }

  int get age => _age;
  set age(int age) => _age = age;
  String get mobileNumber => _mobileNumber;
  set mobileNumber(String mobileNumber) => _mobileNumber = mobileNumber;

  SubmitModel.fromJson(Map<String, dynamic> json) {
    _age = json['age'];
    _mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this._age;
    data['mobileNumber'] = this._mobileNumber;
    return data;
  }
}
