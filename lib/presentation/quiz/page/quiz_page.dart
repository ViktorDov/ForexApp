import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';
import '../../widgets/quiz_navbar.dart';
import '../view_models/quiz_page_models.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({super.key});

  @override
  State<QuizPageWidget> createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizWidgetModel(),
      child: const QuizPageWidgetBody(),
    );
  }
}

class QuizPageWidgetBody extends StatefulWidget {
  const QuizPageWidgetBody({super.key});

  @override
  State<QuizPageWidgetBody> createState() => _QuizPageWidgetBodyState();
}

class _QuizPageWidgetBodyState extends State<QuizPageWidgetBody> {
  bool isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    final model = context.read<QuizWidgetModel>();
    final quiz = model.state.quiz;
    final controller = PageController(initialPage: 0);
    return Scaffold(
        body: PageView.builder(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quiz.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            QuestionFormWidget(currentIndex: index),
            const Spacer(),
            QuizNavBar(
              isButtonEnabled: isButtonEnabled,
              currentPage: index,
              forward: () {
                if (index.round() == 5) {
                  Navigator.pushNamed(context, '/quiz_page/last_page');
                  model.saveResult();
                } else {
                  setState(() {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    isButtonEnabled = false;
                  });
                }
              },
              back: () {
                if (index.round() == 0) {
                  Navigator.pushNamed(context, '/');
                } else {
                  setState(() {
                    controller.animateToPage(index.round() - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    isButtonEnabled = true;
                  });
                }
              },
            )
          ],
        );
      },
    ));
  }
}

// ignore: must_be_immutable
class QuestionFormWidget extends StatefulWidget {
  int currentIndex;
  QuestionFormWidget({super.key, required this.currentIndex});

  @override
  State<QuestionFormWidget> createState() => _QuestionFormWidgetState();
}

class _QuestionFormWidgetState extends State<QuestionFormWidget> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    final model = context.read<QuizWidgetModel>();
    final quiz = model.state.quiz;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //change this first quiz, should be by index
        Image.asset(
          quiz[widget.currentIndex].image,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 30),
          child: Text(
            quiz[widget.currentIndex].question,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.floatButtonColor,
            ),
          ),
        ),
        for (int i = 0; i < 4; i++)
          Container(
            margin: EdgeInsets.only(
              top: AppSize.myWidth(context) * 0.05,
              left: AppSize.myWidth(context) * 0.04,
            ),
            width: AppSize.myWidth(context) * 0.92,
            height: AppSize.myHeight(context) * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 0.5,
                    offset: const Offset(0, 0),
                  ),
                ]),
            child: RadioListTile(
              value: i + 1,
              activeColor: AppColors.activeTextColor,
              title: Text(
                quiz[widget.currentIndex].answers[i],
                style: const TextStyle(
                    color: AppColors.floatButtonColor,
                    fontWeight: FontWeight.w400),
              ),
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  model.saveTempResult(widget.currentIndex, value);
                  _selectedValue = value!;
                  if (value != 0) {
                    _QuizPageWidgetBodyState parentWidget = context
                        .findAncestorStateOfType<_QuizPageWidgetBodyState>()!;
                    parentWidget.setState(() {
                      parentWidget.isButtonEnabled = true;
                    });
                  }
                });
              },
            ),
          ),
      ],
    );
  }
}
