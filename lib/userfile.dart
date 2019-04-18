class Record {
  String location;
  String name;
  String description;
  String gender;
  String contact;
  String hkid;
  bool cssa;
  String dob;
  String age;
  bool reject;
  String heartrate;
  String bloodpressure;
  String bloodglucose;
  String bodyheight;
  String bodyweight;
  String bmi;
  String respirationrate;
  bool smoking;
  bool alcohol;
  bool drugs;
  String additionalinfo1;
  String wound;
  String mentalissues;
  String previousmedicalrecords;
  String additionalinfo2;

  Record(
    String _location,
    String _name,
    String _description,
    String _gender,
    String _contact,
    String _hkid,
    bool _cssa,
    String _dob,
    String _age,
    bool _reject,
    String _heartrate,
    String _bloodpressure,
    String _bloodglucose,
    String _bodyheight,
    String _bodyweight,
    String _bmi,
    String _respirationrate,
    bool _smoking,
    bool _alcohol,
    bool _drugs,
    String _additionalinfo1,
    String _wound,
    String _mentalissues,
    String _previousmedicalrecords,
    String _additionalinfo2,
  ) {
    String location = _location;
    String name = _name;
    String description = _description;
    String gender = _gender;
    String contact = _contact;
    String hkid = _hkid;
    bool cssa = _cssa;
    String dob = _dob;
    String age = _age;
    bool reject = _reject;
    String heartrate = _heartrate;
    String bloodpressure = _bloodpressure;
    String bloodglucose = _bloodglucose;
    String bodyheight = _bodyheight;
    String bodyweight = _bodyweight;
    String bmi = _bmi;
    String respirationrate = _respirationrate;
    bool smoking = _smoking;
    bool alcohol = _alcohol;
    bool drugs = _drugs;
    String additionalinfo1 = _additionalinfo1;
    String wound = _wound;
    String mentalissues = _mentalissues;
    String previousmedicalrecords = _previousmedicalrecords;
    String additionalinfo2 = _additionalinfo2;
  }
}

class UserFile {
  String accesscode;
  String username;
  String email;

  List<Record> records;

  int numrecords = 0;

  UserFile(String _accesscode, String _username, String _email){
    accesscode = _accesscode;
    username = _username;
    email = _email;

    records = [];
  }
}
