import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';


class IntroQuizPage extends StatelessWidget {
  const IntroQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/quiz/intro.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppSize.myHeight(context) * 0.65,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 36,
              ),
              decoration: const BoxDecoration(
                color: AppColors.backgraundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Сколько вы сможете зарабатывать на инвестициях?',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.floatButtonColor,
                    ),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Пройдите официальный опрос от Нашего Приложения - и получите 7 уроков по трейдингу совершенно бесплатно уже сейчас!',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: AppSize.myWidth(context) * 0.85,
                    height: AppSize.myHeight(context) * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.floatButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,'/quiz_page');
                      },
                      child: const Text(
                        'Получить бесплатное обучение',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

