import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';
import '../view_models/last_page_models.dart';

class LastPageWidget extends StatefulWidget {
  const LastPageWidget({super.key});

  @override
  State<LastPageWidget> createState() => _LastPageWidgetState();
}

class _LastPageWidgetState extends State<LastPageWidget> {
  late final LastPageWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = LastPageWidgetModel();
  }

  @override
  Widget build(BuildContext context) {
    return LastPageWidgetProvider(
      model: _model,
      child: const LastPageWidgetBody(),
    );
  }
}

class LastPageWidgetBody extends StatefulWidget {
  const LastPageWidgetBody({super.key});

  @override
  State<LastPageWidgetBody> createState() => _LastPageWidgetBodyState();
}

class _LastPageWidgetBodyState extends State<LastPageWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgraundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBoxGreeting(),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 8),
              child: Text(
                'Оставьте свои контактные данные, чтобы получить обучение. После регистрации обязательно возьмите трубку, эксперт по трейдингу с вами свяжется. ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cardTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextFormFieldsWidget(),
            ),
            ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class AppBoxGreeting extends StatelessWidget {
  const AppBoxGreeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
      ),
      width: AppSize.myWidth(context),
      height: AppSize.myHeight(context) * 0.22,
      child: Container(
        margin: const EdgeInsets.only(top: 42, left: 24, right: 24, bottom: 8),
        child: const Text(
          'Поздравляем!\nНаше Приложение дарит вам бесплатное обучение по трейдингу!',
          style: TextStyle(
            color: AppColors.floatButtonColor,
            fontFamily: 'Poppins',
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class TextFormFieldsWidget extends StatefulWidget {
  const TextFormFieldsWidget({
    super.key,
  });

  @override
  State<TextFormFieldsWidget> createState() => _TextFormFieldsWidgetState();
}

class _TextFormFieldsWidgetState extends State<TextFormFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ErrorTextWidget(),
        SizedBox(height: 10),
        NameTextFormFieldWidget(),
        SizedBox(height: 24),
        LastNameTextField(),
        SizedBox(height: 24),
        EmailTextFieldWidget(),
        SizedBox(height: 24),
        PhoneTextFieldWidget(),
        SizedBox(height: 24),
      ],
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = LastPageWidgetProvider.watch(context)!.model;
    return Text(model.state.errorText,
        style: const TextStyle(
            color: Colors.red, fontSize: 18, fontWeight: FontWeight.w400));
  }
}

class NameTextFormFieldWidget extends StatelessWidget {
  const NameTextFormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = LastPageWidgetProvider.read(context)!.model;
    TextEditingController nameController = TextEditingController();
    return TextFormField(
      controller: nameController,
      onChanged: (value) => model.changeName(value),
      decoration: InputDecoration(
        labelText: 'Введите имя',
        hintText: 'Имя',
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.floatButtonColor,
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: AppColors.floatButtonColor),
        labelStyle: const TextStyle(color: AppColors.floatButtonColor),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = LastPageWidgetProvider.read(context)!.model;
    TextEditingController surnameController = TextEditingController();
    return TextFormField(
      controller: surnameController,
      onChanged: (value) => model.changeLastName(value),
      decoration: InputDecoration(
        labelText: 'Введите фамилию',
        hintText: 'Фамилия',
        hintStyle: const TextStyle(color: AppColors.floatButtonColor),
        labelStyle: const TextStyle(color: AppColors.floatButtonColor),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.floatButtonColor,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = LastPageWidgetProvider.read(context)!.model;
    TextEditingController emailController = TextEditingController();
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => model.changeEmail(value),
      decoration: InputDecoration(
        labelText: 'Введите почту',
        hintText: 'Почта',
        hintStyle: const TextStyle(color: AppColors.floatButtonColor),
        labelStyle: const TextStyle(color: AppColors.floatButtonColor),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Icon(
          Icons.mail,
          color: AppColors.floatButtonColor,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class PhoneTextFieldWidget extends StatelessWidget {
  const PhoneTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = LastPageWidgetProvider.read(context)!.model;
    TextEditingController phoneController = TextEditingController();
    return TextFormField(
      controller: phoneController,
      onChanged: (value) => model.changePhone(value),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Введите телефон',
        hintText: '+',
        hintStyle: const TextStyle(color: AppColors.floatButtonColor),
        labelStyle: const TextStyle(color: AppColors.floatButtonColor),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Icon(
          Icons.phone,
          color: AppColors.floatButtonColor,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    const String _uri = 'https://telegra.ph/Privacy-Policy-02-13-30';
    final model = LastPageWidgetProvider.read(context)!.model;
    final buttonState = model.state.buttonState;
    final onPressButton = buttonState == ViewModelButtonState.enable
        ? () {
            model.onPressedButton(context);
          }
        : null;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Checkbox(
                activeColor: AppColors.floatButtonColor,
                value: model.state.isChecked,
                onChanged: (bool? value) {
                  model.changeIsChecked(value!);
                  setState(() {});
                },
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: AppColors.cardTextColor, fontSize: 14.0),
                  children: <TextSpan>[
                    const TextSpan(text: 'С '),
                    TextSpan(
                      text: 'политикой конфиденциальности',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async{
                          await launchUrl(Uri.parse(_uri));
                        },
                    ),
                    const TextSpan(text: ' ознакомлен(а).'),
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onPressButton,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.floatButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
          ),
          child: const Text(
            'Получить бесплатное обучение',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
