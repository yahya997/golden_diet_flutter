import 'package:shared_preferences/shared_preferences.dart';

Future<bool> savePrefString(String key, String value)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setString(key, value);

}
Future<bool> savePrefInt(String key, int value)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setInt(key, value);
}
Future<bool> savePrefBool(String key, bool value)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setBool(key, value);
}

Future<String> getPrefString(String key)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String value= preferences.getString(key) ?? '';
  return value;
}
Future<int> getPrefInt(String key)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int value= preferences.getInt(key) ?? 0;
  return value;
}
Future<bool> getPrefBool(String key)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool value= preferences.getBool(key) ?? false;
  return value;
}

