import 'package:digital_services/ui/device.dart';
import 'package:digital_services/ui/login.dart';
import 'package:digital_services/ui/otp.dart';
import 'package:digital_services/ui/otp/home_screen.dart';
import 'package:digital_services/ui/otp/otp_screen.dart';
import 'package:digital_services/ui/q_age.dart';
import 'package:digital_services/ui/q_data.dart';
import 'package:digital_services/ui/q_favorite_bundle.dart';
import 'package:digital_services/ui/q_sms.dart';
import 'package:digital_services/ui/q_voice.dart';
import 'package:digital_services/ui/start_questions.dart';
import 'package:digital_services/ui/success.dart';
import 'package:digital_services/utils/colors.dart';
import 'package:digital_services/utils/cut_corners.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SurveyAnswers()),
      ],
          child: MaterialApp(
        title: 'digital_services Digital Services Base',
        debugShowCheckedModeBanner: false,
        theme: _shakesTheme(),
//      home: Login(),
        routes: _routes(),
      ),
    );
  }

  ThemeData _shakesTheme() => _buildShrineTheme();


  Map<String, WidgetBuilder>_routes() {
  return <String
  , WidgetBuilder> {
  Strings.loginRoute: (BuildContext context) => Login(),
  Strings.smsRoute: (BuildContext context) => SMSPage(),
  Strings.dataRoute: (BuildContext context) => DataPage(),
  Strings.otpRoute: (BuildContext context) => OTP(),
  Strings.voiceRoute: (BuildContext context) => Voice(),
  Strings.deviceRoute: (BuildContext context) => Device(),
  Strings.favoriteBundleRoute: (BuildContext context) => Bundle(),
  Strings.ageRoute: (BuildContext context) => Age(),
  Strings.successRoute: (BuildContext context) => Success(),
  Strings.allQuestionsRoute: (BuildContext context) => Questions(),
  //OTP Page
  Strings.homeScreenRoute: (BuildContext context) => HomePage(),
  Strings.otpPageRoute: (BuildContext context) => OtpPage()
  };
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      colorScheme: base.colorScheme.copyWith(
        secondary: kShrineBrown900,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}

}
