import 'package:digital_services/models/verfiy_otp.dart';
import 'package:digital_services/services/auth_service.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:digital_services/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(Strings.otpImage)),
                SizedBox(height: 16.0),
                Text(
                  'Enter the code sent to your sms',
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            SizedBox(height: 120.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _otpController,
                  validator: _validator,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            //             RaisedButton(
            //               // Use this for all the inside cards
            //               color: Colors.blue,
            //               //color: kShrineBrown900
            //   child: Text('NEXT'),
            //   //??CircularProgressIndicator(),
            //   elevation: 12.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(7.0)),
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            /////
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('RESEND OTP'), // TODO USE RESEND OTP
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Strings.loginRoute);
                  },
                ),
                RaisedButton(
                  child: Text('SUBMIT'),
                  elevation: 8.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () async {
                    print('Starting opt in');
                    setState(() {
                      _isLoading = true;
                    });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    sendOTPPressed(context, _otpController.text);
                    setState(() {
                      _isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _validator(String value) {
    if (value.isEmpty) {
      return ' Please enter the OTP';
    }
    return null;
  }

  Future sendOTPPressed(context, String otp) async {
    if (_formKey.currentState.validate()) {
      bool requestOTP = await AuthService.verifyOTP(
          VerifyOTPModel(
              mobileNumber: Provider.of<AuthProvider>(context, listen: false)
                  .phoneNumber
                  .toString(),
              otp: otp.toString()),
          context);
      if (false) { //TODO use requestOTP == true!!!!!!
        // TODO Fix this using backend logic status codes 400 refuse to auth
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Failed to verify otp'), //requestOTP.message -> responseBody
        //   ),
        // );
        print('failed');
      } else {
        //
        //print(Provider.of<LoginProvider>(context).token);
        print(requestOTP);
        print('------------Succeeded---------------------');
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
        Navigator.of(context).pushNamedAndRemoveUntil(
            Strings.allQuestionsRoute, (Route<dynamic> route) => false);
      }
    }
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
