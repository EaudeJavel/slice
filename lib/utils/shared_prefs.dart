// @dart=2.9

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }
  // factory SharedPrefs() => SharedPrefs._internal();

  // SharedPrefs._internal();

  // Future<void> init() async {
  //   _sharedPrefs ??= await SharedPreferences.getInstance();
  // }

// USERNAME

  String get username {
    _sharedPrefs.getString("keyUsername");
  }

  set username(String value) {
    _sharedPrefs.setString("keyUsername", value);
  }

// PICTURE
  String get picture => _sharedPrefs.getString("keyPicture") ?? "";
  set picture(String value) {
    _sharedPrefs.setString("keyPicture", value);
  }
  
  // SharedPrefs({this.username, this.picture});
}

final sharedPrefs = SharedPrefs();


// // @dart=2.9

// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefs {
//   static SharedPreferences _sharedPrefs;

//   init() async {
//     if (_sharedPrefs == null) {
//       _sharedPrefs = await SharedPreferences.getInstance();
//     }
//   }

//   String get username => _sharedPrefs.getString(keyUsername) ?? "";

//   set username(String value) {
//     _sharedPrefs.setString(keyUsername, value);
//   }
// }

// final sharedPrefs = SharedPrefs();

// // constants/strings.dart
// const String keyUsername = "key_username";