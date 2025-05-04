import 'package:shared_preferences/shared_preferences.dart';

class CounterRepository {
  CounterRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<void> saveCounter(int value) async {
    await _sharedPreferences.setInt('counter', value);
  }

  Future<int> getCounter() async {
    return _sharedPreferences.getInt('counter') ?? 0;
  }
}
