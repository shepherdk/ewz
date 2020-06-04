class SurveyAnswersModel {
  int _data;
  int _sms;
  int _voice;
  int _bundle;
  int _device;

  SurveyAnswersModel({int data, int sms, int voice, int bundle, int device}) {
    this._data = data;
    this._sms = sms;
    this._voice = voice;
    this._bundle = bundle;
    this._device = device;
  }

  int get data => _data;
  set data(int data) => _data = data;
  int get sms => _sms;
  set sms(int sms) => _sms = sms;
  int get voice => _voice;
  set voice(int voice) => _voice = voice;
  int get bundle => _bundle;
  set bundle(int bundle) => _bundle = bundle;
  int get device => _device;
  set device(int device) => _device = device;

  SurveyAnswersModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'];
    _sms = json['sms'];
    _voice = json['voice'];
    _bundle = json['bundle'];
    _device = json['device'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this._data;
    data['sms'] = this._sms;
    data['voice'] = this._voice;
    data['bundle'] = this._bundle;
    data['device'] = this._device;
    return data;
  }
}
