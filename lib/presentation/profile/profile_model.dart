import 'package:flutter/material.dart';

import '../../domain/data/data_provider/user_data_provider.dart';

class ProfileModel extends ChangeNotifier {

  final UserDataProvider _userDataProvider = UserDataProvider();

  bool _isName(String value) {
    String pattern = r'^[a-zA-Zа-яА-Я]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // save new user name
  String onChangeNameButtonPressed(String name) {
    final nameIsValided = _isName(name);
    if (name.isEmpty || !nameIsValided) {
      return 'UserName is not valid';
    } else {
      _userDataProvider.saveUserName(name);
      return name;
    }
  }

  Future<void> onPressSingOutButton() async {
    await _userDataProvider.signOut();
  }
}

class ProfileScreenProvider extends InheritedWidget {
  final ProfileModel model;
  const ProfileScreenProvider(
      {super.key, required Widget child, required this.model})
      : super(child: child);

  static ProfileScreenProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileScreenProvider>();
  }

  @override
  bool updateShouldNotify(ProfileScreenProvider oldWidget) {
    return true;
  }
}
