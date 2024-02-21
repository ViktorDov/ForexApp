import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider {
  final _sharedPreferences = SharedPreferences.getInstance();
  Future<void> saveQuizResult(String result) async {
    (await _sharedPreferences).setString('quizResult', result);
    print('Quiz result should be saved');
  }

  Future<String> getName() async {
    return (await _sharedPreferences).getString('name') ?? '';
  }

  Future<String> getSurname() async {
    return (await _sharedPreferences).getString('surname') ?? '';
  }

  Future<String> getEmail() async {
    return (await _sharedPreferences).getString('email') ?? '';
  }

  Future<String> getPhone() async {
    return (await _sharedPreferences).getString('phone') ?? '';
  }

  Future getQuizResult() async {
    return (await _sharedPreferences).getString('quizResult') ?? '';
  }

  Future<void> saveUserName(String name) async {
    (await _sharedPreferences).setString('name', name);
  }

  Future<void> saveUserInfo(String name, surname, email, phone) async {
     (await _sharedPreferences).setString('name', name);
    (await _sharedPreferences).setString('surname', surname);
    (await _sharedPreferences).setString('email', email);
    (await _sharedPreferences).setString('phone', phone);
    (await _sharedPreferences).setBool('isCompleted', true);
  }

  Future<void> signOut() async {
    (await _sharedPreferences).clear();
  }
}
