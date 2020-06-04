import 'package:digital_services/models/answers_model.dart';
import 'package:digital_services/models/submit_model.dart';
import 'package:digital_services/network_utils/network_utils.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitSurvey{
  SubmitSurvey._();

  static Future<bool> submit(SubmitModel body,SurveyAnswersModel getParams, BuildContext context) async {
    print(body.toJson());
    print(getParams.toJson());
    final response = await NetworkUtils(token: Provider.of<AuthProvider>(context, listen: false).token)
        .postAuth('${SubmitURL.submit}/${getParams.sms}/${getParams.data}/${getParams.voice}/${getParams.device}/${getParams.bundle}', body);
        // save token and model
       //print(token);
        //final data=json.decode(response.body);
        //print(data);
        return response.statusCode == 200;    //200 OK, 400 number exists in db but you still get OTP, 400 fake number, 
                                            // either way go to OTP screen
      }
    }
    // sms/data/voice/device/bundle/   -> id starts from one
    //TODO submit model -> contains - age and mobile number (provider)
    