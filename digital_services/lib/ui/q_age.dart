import 'package:digital_services/models/answers_model.dart';
import 'package:digital_services/models/submit_model.dart';
import 'package:digital_services/services/submit_survey_service.dart';
import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  TextEditingController _ageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;

    return Column(
          children: <Widget>[
            SizedBox(height: 24),
            Text('How old are you?',
                style: Theme.of(context).textTheme.headline),
            SizedBox(height: 80),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                validator: _validator,
                decoration: InputDecoration(
                  labelText: 'Your age',
                ),
              ),
            ),
            //age will be in textfield
            SizedBox(height: 24),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                    child: Text('SUBMIT ANSWERS'),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () async {
                      print('Starting sign in');
                      setState(() {
                        _isLoading = false;
                      });
                      _submitPressed(context);
                      setState(() {
                        _isLoading = false;
                      });
                    }),
              ],
            ),
          ],
        );
  }

  //Navigate to Success Page/ OR failure if you already registered and completed the survey

  _goTo(int age) {
    if (_formKey.currentState.validate()) {
      Provider.of<SurveyAnswers>(context).age = age;
      Navigator.pushReplacementNamed(context, Strings.successRoute);
    }
  }

  String _validator(String value) {
    if (value.isEmpty) {
      return ' Please enter your age';
    }
    return null;
  }

  Future _submitPressed(context) async {
    if (_formKey.currentState.validate()) {
      String age = _ageController.text.toString();
      print(age);
      Provider.of<SurveyAnswers>(context, listen: false).age = int.parse(age);
      bool postAnswers = await SubmitSurvey.submit(
          SubmitModel(
            age: int.parse(age),
            mobileNumber: Provider.of<AuthProvider>(context, listen: false)
                .phoneNumber
                .toString(),
          ),
          SurveyAnswersModel(
            bundle: Provider.of<SurveyAnswers>(context, listen: false).bundle,
            data: Provider.of<SurveyAnswers>(context, listen: false).data,
            device: Provider.of<SurveyAnswers>(context, listen: false).device,
            sms: Provider.of<SurveyAnswers>(context, listen: false).sms,
            voice: Provider.of<SurveyAnswers>(context, listen: false).voice,
          ),
          context);
      if (postAnswers == true) {
        // TODO Fix this using backend logic status codes 400 refuse to auth
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     //TODO go to error page
        //     content: Text('Failed to verify'), //requestOTP.message -> responseBody
        //   ),
        // );
        print('FALSE!!!!!');
      } else {
        //
        //print(Provider.of<LoginProvider>(context).token);
        print(postAnswers);
        print('---------------------------------');
        //EmployeeModel employeeResponse = await LoginService.getUserDetails(loginAttempt.responseBody.id, context);
        //Provider.of<LoginProvider>(context).employeeResponse=employeeResponse;
        // get value and store in provider, create employee model first
        // Provider
        //print(Provider.of<LoginProvider>(context).employeeResponse.toJson());
        // Get value of loan types and store them in cache -> Provider
        //LoanTypesModel getLoanTypesResponse = await LoanService.getLoanTypes(context);
        //Provider.of<LoanTypeProvider>(context).loanTypes = getLoanTypesResponse;
        //print(Provider.of<LoanTypeProvider>(context).loanTypes);
        // ---- //

        //Store phone number
        //
        Navigator.of(context).pushReplacementNamed(Strings.successRoute);
      }
    }
  }
}
