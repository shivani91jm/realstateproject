import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userIdKey = 'id';
  static const String _tokenKey = 'token';
  static const String _nameKey = 'name';
  static const String _emailKey = 'email';
  static const String _mobileKey='mobile';
  static const String _imageKey='image';
  static const String _verifyEmailKey='verifyEmail';
  static const String _addressKey='address';


  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  static Future<bool?> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey);
  }

  static Future<void> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }
  static Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }
  static Future<void> setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }
  static Future<void> setEmail(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, name);
  }
  static Future<void> setMobile(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_mobileKey, name);
  }
  static Future<void> setImage(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, name);
  }
  static Future<void> setVerifyEmail(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_verifyEmailKey, name);
  }
  static Future<void> setAddress(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_addressKey, name);
  }
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }


  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
  static Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }
  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }
  static Future<String?> getAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_addressKey);
  }
  static Future<String?> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageKey);
  }
  static Future<String?> getVerifyEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_verifyEmailKey);
  }
  static Future<String?> getMobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_mobileKey);
  }

  static Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }




//
// //------------------------store data in local ---------------------
// SharedPreferences prefs = await SharedPreferences.getInstance();
// await prefs.setString('email', email);
// await prefs.setString('user_id', data.userId.toString());
// await prefs.setString('username', data.userNicename.toString());
// await prefs.setString('mobile_number', data.mobileNumber.toString());
// await prefs.setString('user_profile', data.profilePicture.toString());
// await prefs.setString('user_firstName', data.first_name.toString());
// await prefs.setString('user_lastName', data.last_name.toString());
//
// showDialog(context: context!, builder: (BuildContext context) {
//   return  CustomDialogBox(title: AppConstentData.Login,
//     descriptions: AppConstentData.loginsucess,
//     img: Image.asset(ImageUrls.check_url), okBtn: AppConstentData.ok
//     , cancelBtn: AppConstentData.cancel, pagename: RouteNames.dashboard_screen,);
// }
// );
}