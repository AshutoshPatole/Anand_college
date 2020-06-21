import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum Status { UnAuthenticated, Authenticated, Authenticating, Uninitialized }

class LoginModels extends ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  var db = Firestore.instance;
  Status _status = Status.Uninitialized;

  bool isDisposed = false;

  String _userPhoneNumber;
  String _userName;
  String _father;
  String _dob;
  String _sex;
  String _age;
  String _nationality;
  String _caste;
  String _religion;

  String get userName => _userName;
  String get phoneNumber => _userPhoneNumber;
  Status get status => _status;
  String get father => _father;
  String get dob => _dob;
  String get sex => _sex;
  String get age => _age;
  String get nationality => _nationality;
  String get caste => _caste;
  String get religion => _religion;

  FirebaseUser get user => _user;

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.UnAuthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    if (!isDisposed) {
      notifyListeners();
    }
  }

  LoginModels.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged?.listen(_onAuthStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return true;
    } catch (e) {
      _status = Status.UnAuthenticated;
      notifyListeners();
      return false;
    }
  }

  Future getUsersDetails() async {
    DocumentSnapshot documentSnapshot =
        await db.collection('userInfo').document(_user?.uid).get();

    if (documentSnapshot.exists) {
      _userPhoneNumber = documentSnapshot['Phone'];
      _userName = documentSnapshot['Name'];
      _father = documentSnapshot['father'];
      _dob = documentSnapshot['dob'];
      _sex = documentSnapshot['sex'];
      _age = documentSnapshot['age'];
      _nationality = documentSnapshot['nation'];
      _caste = documentSnapshot['caste'];
      _religion = documentSnapshot['religion'];
      notifyListeners();
    }
  }

  Future bookSeat(
    String course,
    String tenthSchoolName,
    String tenthCutoff,
    String twelthSchoolName,
    String twelthCutOff,
    String name,
    String phone,
  ) async {
    await db
        .collection('courses')
        .document(course)
        .collection('booked')
        .document(_user?.uid)
        .setData(
      {
        'email': _user?.email,
        'name': name,
        'phone': phone,
        'dob': _dob,
        'age': _age,
        'sex': _sex,
        'nation': _nationality,
        'religion': _religion,
        'caste': _caste,
        'tenthSchoolName': tenthSchoolName,
        'tenthCutOff': tenthCutoff,
        'twelthSchoolName': twelthSchoolName,
        'twelthCutOff': twelthCutOff
      },
    );
  }

  Future help(String helpText) async {
    var db = Firestore.instance;
    DocumentSnapshot documentSnapshot =
        await db.collection('userInfo').document(_user?.uid).get();
    if (documentSnapshot.exists) {
      _userPhoneNumber = documentSnapshot['Phone'];
      _userName = documentSnapshot['Name'];
      notifyListeners();
    }
    Future.delayed(Duration(milliseconds: 500), () {});
    await db.collection('help').document(_user?.uid).setData({
      'help': helpText,
      'email': _user?.email,
      'phone': _userPhoneNumber,
      'name': _userName,
    });
  }

  Future<FirebaseUser> signUp(
    String email,
    String password,
    String phoneNumber,
    String userName,
    String father,
    String dob,
    String sex,
    String age,
    String nationality,
    String caste,
    String religion,
  ) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      CreateUser(uid: result?.user?.uid).updateToDatabase(
        email,
        phoneNumber,
        userName,
        father,
        dob,
        sex,
        age,
        nationality,
        caste,
        religion,
      );
      _status = Status.Authenticating;
      notifyListeners();
      return result.user;
    } catch (e) {
      _status = Status.UnAuthenticated;
      notifyListeners();
      return null;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.UnAuthenticated;
    notifyListeners();
    Future.delayed(Duration.zero);
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}

class CreateUser {
  final String uid;

  CreateUser({this.uid});

  CollectionReference userInfo = Firestore.instance.collection('userInfo');

  Future updateToDatabase(
    String email,
    String phoneNumber,
    String userName,
    String father,
    String dob,
    String sex,
    String age,
    String nationality,
    String caste,
    String religion,
  ) async {
    return await userInfo.document(uid).setData({
      'Name': userName,
      'Email': email,
      'Phone': phoneNumber,
      'father': father,
      'dob': dob,
      'sex': sex,
      'age': age,
      'nation': nationality,
      'caste': caste,
      'religion': religion,
    });
  }
}
