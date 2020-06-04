import 'dart:convert';
import 'package:digital_services/models/request.dart';
import 'package:digital_services/models/verfiy_otp.dart';
import 'package:digital_services/network_utils/network_utils.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthService {
  // receives model
  AuthService._();
  static Future<int> requestOTP(RequestOTPModel body,BuildContext context) async {
    print(body.toJson());
    final response = await NetworkUtils().post(AuthURL.requestOTP, body.toJson());
    // save token and model
   //print(token);
    //final data=json.decode(response.body);
    print(response);
    return response.statusCode;    //200 OK, 400 number exists in db but you still get OTP, 400 fake number, 
                                        // either way go to OTP screen
  }

  // store the token, since the user needs to be authenticated for the next api_hit
  // TODO handle non existent numbers, duplicate.
  static Future<bool> verifyOTP(VerifyOTPModel body, BuildContext context) async{
    print(body.toJson());
    final response = await NetworkUtils().post(AuthURL.authUser, body.toJson());
    //
    print(jsonDecode(response.body));
    final token = response?.headers['authorization']?.split(' ')?.last;
    Provider.of<AuthProvider>(context, listen: false).token=token;
    return (response.statusCode == 200); // 400 bad credentials
}

  static Future<int> resendOTP(RequestOTPModel body,BuildContext context) async {
    print(body.toJson());
    final response = await NetworkUtils().post(AuthURL.requestOTP, body.toJson());
    // save token and model
   //print(token);
    final data=json.decode(response.body);
    print(data);
    return response.statusCode;    //200 OK, 400 number exists in db but you still get OTP, 400 fake number, 
                                        // either way go to OTP screen
  }

}