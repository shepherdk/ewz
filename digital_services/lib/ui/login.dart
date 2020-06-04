import 'package:digital_services/models/request.dart';
import 'package:digital_services/services/auth_service.dart';
import 'package:digital_services/utils/colors.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneNumberController = TextEditingController();
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
                ClipOval(child: Container(color: Colors.blue, child: ClipOval(child: SizedBox(height: 72, width: 72, child: Image.asset(Strings.ewzImage,))))),
                SizedBox(height: 16.0),
                Text(
                  'Econet Digital Services',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            SizedBox(height: 120.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: Form(
                  key: _formKey,
                              child: TextFormField(
                  controller: _phoneNumberController,
                  validator: _validator,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
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
                  child: Text('CANCEL'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  child: 
                  Text('NEXT'),
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
                    return Center(child: CircularProgressIndicator(),);
                  });
                           optInPressed(context, _phoneNumberController.text);
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

    final Widget _imageSection = Image.asset(
      Strings.ewzImage,
      fit: BoxFit.fitHeight,
      width: double.infinity,
    );

  String _validator(String value) {
    if (value.isEmpty) {
      return ' Please enter your phone number     ';
    }
    return null;
  }

   optInPressed(context, String phoneNumber) async {
    if (_formKey.currentState.validate()) {
      int requestOTP = await AuthService.requestOTP(
          RequestOTPModel(
            mobileNumber: phoneNumber.toString()
          ),
          context);
      if (false) { // TODO Fix this using backend logic status codes 400 refuse to auth
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Failed to send OTP, try again'), //requestOTP.message -> responseBody
        //   ),
        // );
        print(requestOTP);
        print('failed');
      } else { //
        //print(Provider.of<LoginProvider>(context).token);
        print('---------------------------------');
        print(requestOTP);
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
        Provider.of<AuthProvider>(context, listen: false).phoneNumber = phoneNumber.toString();
        print('navigator');
        Navigator.of(context).pushNamed(Strings.otpRoute);
        print('done');
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




////////////////////////////////////////////////////////////////////////////////////////////////////

// TextEditingController _phoneNumberController;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _phoneNumberController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool _isLoading = false;
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(10, 60, 15, 10),
//         child: Column(
//           children: <Widget>[
//             Flexible(
//               flex: 1,
//               child: _imageSection,
//             ),
//             Flexible(
//               flex: 2,
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                         'Enter Your Phone Number',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'PT Sans',
//                         ),
//                       ),
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Form(
//                         key: _formKey,
//                           child: TextFormField(
//                           controller: _phoneNumberController,
//                           keyboardType: TextInputType.number,
//                           validator: _validator,
//                           style: TextStyle(
//                             fontSize: 24,
//                           ),
//                           decoration: InputDecoration(
//                             prefixIcon: Padding(
//                                 padding: EdgeInsets.all(10),
//                                 child: Text(
//                                   '+263',
//                                   style: TextStyle(
//                                       fontSize: 24, fontWeight: FontWeight.w500),
//                                   textAlign: TextAlign.center,
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     skButton(
//                         // onPress: () => Navigator.pushNamed(
//                         //     context, Strings.otpRoute)),
//                         onPress: () async {
//                           print('Starting opt in');
//                           setState(() {
//                             _isLoading = false;
//                           });
//                            optInPressed(context, _phoneNumberController.text);
//                           setState(() {
//                             _isLoading = false;
//                           });
//                         }
//                     ),
//                     //skButton(onPress: () => Navigator.pushNamed(context, Strings.smsRoute)),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _illustration() => SvgPicture.asset(
//   //       Strings.loginImage,
//   //     );