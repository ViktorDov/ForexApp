import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_size.dart';
import '../navigation/routes.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_icon_button.dart';
import 'profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileModel _model;

  @override
  void initState() {
    _model = ProfileModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScreenProvider(
      model: _model,
      child: const ProfileScreenBody(),
    );
  }
}

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  static const String support = 'https://telegra.ph/Privacy-Policy-02-13-30';
  static const String instr = 'https://forms.gle/eMDngziXq1CsUaKs7';
  String _userName = 'UserName';
  String _email = 'user@gmail.com';
  late TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loadPreferences();
    _nameController = TextEditingController();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? 'Username';
      _email = prefs.getString('email') ?? 'email.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ProfileScreenProvider.of(context)!.model;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              leftIconPath: 'assets/logo/favorite.svg',
              showIconButton: false,
              title: 'Профиль',
              backgroundColor: AppColors.floatButtonColor,
              textColor: Colors.white,
              onLeftIconPressed: () {},
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.floatButtonColor,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppColors.floatButtonColor,
                        ),
                      ),
                      Text(
                        _email,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[850],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse(instr));
                    },
                    child: Container(
                      width: AppSize.myWidth(context) * 0.45,
                      height: AppSize.myHeight(context) * 0.16,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.all(6),
                            width: AppSize.myWidth(context) * 0.1,
                            height: AppSize.myHeight(context) * 0.04,
                            child: SvgPicture.asset('assets/logo/file.svg'),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 5,
                          ),
                          const Text(
                            'Тех Поддержка',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.floatButtonColor),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Обратиться в клиент-сервис',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      launchUrl(Uri.parse(support));
                    },
                    child: Container(
                      width: AppSize.myWidth(context) * 0.45,
                      height: AppSize.myHeight(context) * 0.16,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.all(6),
                            width: AppSize.myWidth(context) * 0.1,
                            height: AppSize.myHeight(context) * 0.04,
                            child: SvgPicture.asset('assets/logo/file.svg'),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 5,
                          ),
                          const Text(
                            'Политика',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.floatButtonColor),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Политика конфиденциальности',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: AppSize.myWidth(context),
              height: AppSize.myWidth(context) * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIconButton(
                    iconData: 'assets/logo/settings.svg',
                    text: 'Изменить профиль',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Изменить профиль'),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _nameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Имя',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        final name =
                                            model.onChangeNameButtonPressed(
                                          _nameController.text,
                                        );
                                        setState(() {
                                          _userName = name;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Сохранить',
                                        style: TextStyle(
                                          color: AppColors.floatButtonColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  CustomIconButton(
                    iconData: 'assets/logo/add_chart.svg',
                    text: 'Мои стратегии',
                    onTap: () => Navigator.of(context)
                        .pushNamed(NavigationRoutesName.favoriteScreen),
                  ),
                  CustomIconButton(
                    iconData: 'assets/logo/logout.svg',
                    text: 'Выход',
                    onTap: () {
                      model.onPressSingOutButton();
                      Navigator.of(context)
                          .pushNamed(NavigationRoutesName.introQuizPage);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
