import 'package:flutter/cupertino.dart';


import '../../../domain/data/api/api_user_service.dart';
import '../../../domain/data/data_provider/user_data_provider.dart';
import '../../navigation/routes.dart';

enum ViewModelButtonState {
  disable,
  enable,
}

class ViewModelState {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final bool isChecked;
  final String errorText;
  ViewModelButtonState get buttonState {
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        lastName.isNotEmpty &&
        isChecked == true) {
      return ViewModelButtonState.enable;
    } else {
      return ViewModelButtonState.disable;
    }
  }

  ViewModelState({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.errorText = '',
    this.isChecked = false,
  });
  ViewModelState copyWith(
      {String? name,
      String? lastName,
      String? email,
      String? phone,
      String? errorText,
      bool? isChecked}) {
    return ViewModelState(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        errorText: errorText ?? this.errorText,
        isChecked: isChecked ?? this.isChecked);
  }
}

class LastPageWidgetModel extends ChangeNotifier {
  var _state = ViewModelState();
  ViewModelState get state => _state;
  final UserDataProvider _userDataProvider = UserDataProvider();
  final ApiUserService _apiUserService = ApiUserService();

  void changeName(String value) {
    _state = _state.copyWith(name: value);
    notifyListeners();
  }

  void changeLastName(String value) {
    _state = _state.copyWith(lastName: value);
    notifyListeners();
  }

  void changeEmail(String value) {
    _state = _state.copyWith(email: value);
    notifyListeners();
  }

  void changePhone(String value) {
    _state = _state.copyWith(phone: value);
    notifyListeners();
  }

  void changeIsChecked(bool value) {
    _state = _state.copyWith(isChecked: value);
    notifyListeners();
  }

  //validate email
  bool _isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  //validate user name
  bool _isName(String value) {
    String pattern = r'^[a-zA-Zа-яА-Я]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // validate phone
  bool _isPhone(String value) {
    const String pattern = r'^\+[78]\d{10}$';
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void onPressedButton(BuildContext context) {
    //todo:
    //1. navigation to main screen 
    final name = _state.name;
    final lastName = _state.lastName;
    final email = _state.email;
    final phone = _state.phone;
    final isChecked = _state.isChecked;
    if (name.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        isChecked == false) return;
    _state = _state.copyWith(errorText: '');
    notifyListeners();
    final emailIsValided = _isEmail(email);
    final phoneIsValided = _isPhone(phone);
    final nameIsValided = _isName(name);

    // validation user data
    if (!nameIsValided || name.length < 2 || lastName.length < 2) {
      _state = _state.copyWith(errorText: ' Некорректное имя или фамилия :(');
      notifyListeners();
    } else if (!emailIsValided) {
      _state = _state.copyWith(errorText: 'Неверный формат почты :( ');
      notifyListeners();
    } else if (!phoneIsValided) {
      _state = _state.copyWith(errorText: 'Неверный формат телефона :(');
      notifyListeners();
    } else {
      _userDataProvider.saveUserInfo(name, lastName, email, phone);
      _apiUserService.sendRequest();
       Navigator.pushNamed(context, NavigationRoutesName.homeScreen);
    }
  }
}

class LastPageWidgetProvider extends InheritedNotifier {
  final LastPageWidgetModel model;
  const LastPageWidgetProvider(
      {Key? key, required Widget child, required this.model})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static LastPageWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LastPageWidgetProvider>();
  }

  static LastPageWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LastPageWidgetProvider>()
        ?.widget;
    return widget is LastPageWidgetProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(LastPageWidgetProvider oldWidget) {
    return true;
  }
}
