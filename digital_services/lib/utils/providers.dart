import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';
  String _phoneNumber = '';

  String get token => _token;
  set token(String p) {
    _token = p;
    notifyListeners();
  }

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  // LoginResponseModel get loginResponse => _loginResponse;
  // set loginResponse(LoginResponseModel p) {
  //   _loginResponse = p;
  //   notifyListeners();
  // }
}

class SurveyAnswers with ChangeNotifier {
//sms/data/voice/device/bundle/age
  int _sms = 0;
  int _data = 0;
  int _voice = 0;
  int _device = 0;
  int _bundle = 0;
  int _age = 0;

  int get sms => _sms;
  set sms(int number) {
    _sms = number;
    notifyListeners();
  }

  int get data => _data;
  set data(int number) {
    _data = number;
    notifyListeners();
  }

  int get voice => _voice;
  set voice(int number) {
    _voice = number;
    notifyListeners();
  }

  int get device => _device;
  set device(int number) {
    _device = number;
    notifyListeners();
  }

  int get bundle => _bundle;
  set bundle(int number) {
    _bundle = number;
    notifyListeners();
  }

  int get age => _age;
  set age(int number) {
    _age = number;
    notifyListeners();
  }

}