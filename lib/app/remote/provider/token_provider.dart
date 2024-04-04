part of '../remote.dart';

class TokenProvider {
  SharedPreferences? _prefs;

  TokenProvider() {
    init();
  }


  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) async {
    await _prefs?.setString('token', token);
  }

  String? getToken() {
    return _prefs?.getString('token');
  }


}
