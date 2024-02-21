import 'package:flutter/material.dart';
import '../../../domain/data/data_provider/user_data_provider.dart';
import '../../../domain/entity/quiz.dart';

class QuizState {
  final int currentPage;
  final Map<String, String> result;
  final Map<int, int> answer;
  final List<Quiz> quiz = const [
    Quiz(
      image: 'assets/images/quiz/1.png',
      question: 'Какой ваш возраст?',
      answers: [
        '18-25',
        '25-35',
        '35-45',
        '45+',
      ],
    ),
    Quiz(
      image: 'assets/images/quiz/2.png',
      question: 'Ваша финансовая цель?',
      answers: [
        'Обеспечить себя и семью',
        'Создать финансвую подушку на “черный день” ',
        'Благоустросить/купить личное жилье',
        'Быть материально незавсимым',
      ],
    ),
    Quiz(
      image: 'assets/images/quiz/3.png',
      question: 'Куда вы планируете потратить первые заработанные деньги?',
      answers: [
        'Погашу кредиты/ипотеку/долги',
        'Куплю то, о чем давно мечтал(а)',
        'На путешествия',
        'Я вложу их снова, чтобы приумножить капитал',
      ],
    ),
    Quiz(
      image: 'assets/images/quiz/4.png',
      question: 'Сколько времени вы готовы уделять заработку?',
      answers: [
        'Весь день',
        'Несколько часов в день',
        'Один день в неделю',
        'Один день в месяц',
      ],
    ),
    Quiz(
      image: 'assets/images/quiz/5.png',
      question: 'Готовы ли вы вкладывать в свое обучение новой профессии?',
      answers: [
        'Да',
        'Скорее да, чем нет',
        'Скорее нет, чем да',
        'Нет',
      ],
    ),
    Quiz(
      image: 'assets/images/quiz/6.png',
      question:
          'Готовы ли вы вкладывать в трейдинг? Ведь, как известно, чтобы что-то получить, необходимо что-то вложить',
      answers: [
        'Да, готов(а)',
        'Я бы хотел(а), но нет уверенности, что у меня получится',
        'Я уже вкладываю и получаю дивиденды',
        'Нет, я не хочу вкладывать',
      ],
    ),
  ];

  // default result state
  const QuizState({
    this.currentPage = 0,
    this.answer = const {
      0: 1,
      1: 1,
      2: 1,
      3: 1,
      4: 1,
      5: 1,
    },
    this.result = const {
      'Какой ваш возраст?': '18-25',
      'Ваша финансовая цель?': 'Обеспечить себя и семью',
      'Куда вы планируете потратить первые заработанные деньги?':
          'Погашу кредиты/ипотеку/долги',
      'Сколько времени вы готовы уделять заработку?': 'Весь день',
      'Готовы ли вы вкладывать в свое обучение новой профессии?': 'Да',
      'Готовы ли вы вкладывать в трейдинг? Ведь, как известно, чтобы что-то получить, необходимо что-то вложить':
          'Да, готов(а)',
    },
  });

  // get props
  List<Object> get props => [
        currentPage,
        result,
      ];

  // copyWith for update result state
  QuizState copyWith({
    int? currentPage,
    Map<String, String>? result,
    Map<int, int>? answer,
  }) {
    return QuizState(
      currentPage: currentPage ?? this.currentPage,
      result: result ?? this.result,
      answer: answer ?? this.answer,
    );
  }
}

class QuizWidgetModel extends ChangeNotifier {
  final _state = const QuizState();
  QuizState get state => _state;
  Map<String, String> tempResult = {};
  String finalResult = '';
  UserDataProvider userDataProvider = UserDataProvider();
  
  // temp  quiz's result 
  void saveTempResult(int currentPage, value) {
    final quest = _state.quiz[currentPage].question;
    final answer = _state.quiz[currentPage].answers[value - 1];
    
    tempResult.addAll({quest: answer});
  }
  // save result to local storage 
  void saveResult() {
    final res = <String>[];
    for (int i = 0; i < tempResult.length; i++) {
      res.add([tempResult.keys.elementAt(i), tempResult.values.elementAt(i)].join(': ').toString());
      finalResult = res.join(' | ');
    }
    userDataProvider.saveQuizResult(finalResult);
  }
}


class QuestionsWidgetProvider extends InheritedNotifier {
  final QuizWidgetModel model;
  const QuestionsWidgetProvider(
      {Key? key, required Widget child, required this.model})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static QuestionsWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<QuestionsWidgetProvider>();
  }

  static QuestionsWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<QuestionsWidgetProvider>()
        ?.widget;
    return widget is QuestionsWidgetProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(QuestionsWidgetProvider oldWidget) {
    return true;
  }
}
