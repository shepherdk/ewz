class BaseURL {

  static const String dev = 'https://digital-customer-services.herokuapp.com/api/v1';
  static const String live = '';
}

class AuthURL {

  static const String defaultURL = '/users';
  static const String requestOTP = defaultURL + '/signup' + '/1'; //number TODO {role -> id}
  static const String authUser = defaultURL + '/signin';   //otp and number
  static const String resendOTP = defaultURL + '/resend-OTP';   //otp and number

}

class SubmitURL {

  static const String defaultURL = '/opt-in';
  static const String submit = defaultURL + '/register'; // data/sms/voice/bundle/device/   -> id starts from one
}