import 'package:flutter/foundation.dart';

class UserInfo extends ChangeNotifier {
  String _name;
  String _email;
  String _phoneNumber;
  String _courseID;

  String _father;
  String _dob;
  String _sex;
  String _age;
  String _nationality;
  String _caste;
  String _religion;

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;

  String get father => _father;
  String get dob => _dob;
  String get sex => _sex;
  String get age => _age;
  String get nationality => _nationality;
  String get caste => _caste;
  String get religion => _religion;
  String get courseID => _courseID;

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPhone(String newPhone) {
    _phoneNumber = newPhone;
    notifyListeners();
  }

  void setFatherName(String newFather) {
    _father = newFather;
    notifyListeners();
  }

  void setDOB(String newFather) {
    _dob = newFather;
    notifyListeners();
  }

  void setSEX(String newFather) {
    _sex = newFather;
    notifyListeners();
  }

  void setAge(String newFather) {
    _age = newFather;
    notifyListeners();
  }

  void setNationality(String newFather) {
    _nationality = newFather;
    notifyListeners();
  }

  void setCaste(String newFather) {
    _caste = newFather;
    notifyListeners();
  }

  void setReligion(String newFather) {
    _religion = newFather;
    notifyListeners();
  }

  void setCourseID(String newCourse) {
    _courseID = newCourse;
    notifyListeners();
  }
}
